/*
 * This file is part of GDownloader.
 *
 * Copyright (C) 2014 Victor A. Santos <victoraur.santos@gmail.com>
 *
 * GDownloader is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GDownloader is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


namespace GDownloader {

    [GtkTemplate (ui = "/org/gdownloader/ui/new-download.ui")]
    class NewDownloadDialog : Gtk.Dialog
    {
        [GtkChild]
        public Gtk.Box advanced_hbox;

        [GtkChild]
        public Gtk.CheckButton show_advanced_chk;

        public NewDownloadDialog(Application app)
        {
            var clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD);
            var clip_text = clipboard.wait_for_text();

            set_transient_for(app.active_window);
        }

        [GtkCallback]
        public void on_toggle_show_advanced()
        {
            advanced_hbox.set_visible(show_advanced_chk.active);
        }
    }
} 
