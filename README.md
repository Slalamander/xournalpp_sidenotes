# Side Notes for Xournal++

A plugin to quickly add small sidebar pages for notetaking to documents.

This is a quick plugin I wrote to make it easier to set up notetaking in Xournal++ in my preferred way. That being, having a small empty space on the right of a pdf page where I can write additional notes.

Plugin for Xournal++ to quickly add note pages to the sides of pdfs, without needing configuration. The manual way requires for, at least each document, to figure out the height of a page by setting the page template to copy the previous page, saving that height, changing the width of the newly added page, and changing the page template to the correct height and desired width. This plugin does almost all of that in a single button press, all that is missing is the ability to configure the width of the notes from the message box. This also means that documents with varying page sizes do not require reconfiguring.

![Example of notes](https://github.com/Slalamander/xournalpp_sidenotes/blob/main/.github/NoteExample.png)
Text from: _Petersen and McPhee, “A Study of Volumetric Contact Modelling Approaches in Rigid Tyre Simulation for Planetary Rover Application.”_

# Installation

Download the .zip file from the releases, and add the `SideNotes` folder to your Xournal++'s plugin folder. At the time of writing, that is the _shared resources_ folder, but that may change in a future build to the _config folder_. See the [plugin page](https://xournalpp.github.io/guide/plugins/plugins/#installation-folder) of the Xournal docs.

# Usage

Open the `Plugin` menu in the top menu bar. If there is no entry called `Side Notes` there, open the plugin manager and enable the plugin. This requires restarting Xournal++ to take effect.
Once clicking the menu item, a popup will appear explaining what will happen, as well as noting the width of the note pages (in the unit of points). Click _yes_, and the note pages will be added (for larger documents it may take a little bit).

![Example of the message box](https://github.com/Slalamander/xournalpp_sidenotes/blob/main/.github/MessageBox.png)
![Document after adding note pages](https://github.com/Slalamander/xournalpp_sidenotes/blob/main/.github/NotePages.png)

The plugin takes care of only adding pages to pages belonging to the original pdf by checking the background property. This means that running the pluging multiple times does not lead to additional pages being added.
