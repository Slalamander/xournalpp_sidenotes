-- Plugin to make it easier to add note pages to the side of a pdf, made to accomodate my preferred note taking
-- For exporting the notes, it may be useful to write a function that combines the pages and notes

note_width = 283.46 --pagewidth is in points (this is a width of 10cm)

-- Register all Toolbar actions and initialize all UI stuff
function initUi()
  ref = app.registerUi({["menu"] = "Side Notes", ["callback"] = "showMessage"}); --, ["accelerator"] = "<Control>t"});
  print("Note pages plugin registered\n");
end

function showMessage()
  -- msgtext = "PDF Note Pages"
  currentpage = app.getDocumentStructure().currentPage
  msgtext = string.format("Add an empty page to the right of each pdf page, with the height of the previous page and %f point width\n", note_width)
    msgtext = msgtext .. "Note page width can be changed in the main.lua file of the plugin\n\n"
  msgtext = msgtext .. "Background and background color are taken from page template. Copying background from current page will lead to issues.\n\n"
  msgtext = msgtext .. "Add note pages to pdf?"

  result = app.msgbox(msgtext, {[1] = "Yes", [2] = "No"});
  print("result = " .. result)
  if result == 1 then
    addNotePages()
  end
end

-- Callback if the menu item is executed
function addNotePages()
  local docStructure = app.getDocumentStructure()
  local numPages = #docStructure.pages
  local pages = docStructure.pages
  local initpage = docStructure.currentPage*2 - 1 --Current page user is at, corrected for added note pages

  pagei = 0
  notecount = 0
  
  for i=1, numPages do
    -- Pages and numPages do not change as pages are added
    
    -- Update the current page as new page is added after current page
    pagei = pagei + 1
    app.setCurrentPage(pagei)

    page = pages[i]
    pagewidth = page.pageWidth
    pageheight = page.pageHeight

    -- Don't only check current page, als page after
    -- and edge case for last page
    local addnote = false
    if i == numPages and page.pdfBackgroundPageNo ~= 0 then
      addnote = true
    elseif page.pdfBackgroundPageNo ~= 0 and pages[i+1].pdfBackgroundPageNo ~= 0 then
      addnote = true
    end

    if addnote then
      app.uiAction({ action = "ACTION_NEW_PAGE_AFTER" })
      pagei = pagei + 1
      app.setCurrentPage(pagei)
      app.setPageSize(note_width, page.pageHeight)
      notecount = notecount + 1
    end
  end

  -- msg = string.format("Current page is %i, scrolling back to %i", currentpage, endpage)
  -- app.msgbox(msg, {[1] = "Ok"});
  app.scrollToPage(initpage)
  app.setCurrentPage(initpage)

  print(string.format("Succesfully added %i note pages", notecount))
end
