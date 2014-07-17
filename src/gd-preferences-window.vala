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

    [GtkTemplate ( ui = "/org/gdownloader/ui/preferences.ui" )]
    public class PreferencesWindow : Gtk.Window
    {
        /* Instance */
        public static PreferencesWindow s_instance;

        public PeasGtk.PluginManager core_manager;
        public PeasGtk.PluginManager hoster_manager;

        /* Widgets */
        [GtkChild]
        private Gtk.Notebook main_note;

        public PreferencesWindow(Application app)
        {
            set_transient_for(app.active_window);

            // hide on close instead of destroy
            delete_event.connect(hide_on_delete);

            // Append plugins managers
            core_manager = new PeasGtk.PluginManager(app.core);
            hoster_manager = new PeasGtk.PluginManager(app.hoster);

            var core_lbl = new Gtk.Label("Core Plugins");
            var hoster_lbl = new Gtk.Label("Hoster Plugins");

            main_note.append_page(core_manager, core_lbl);
            main_note.append_page(hoster_manager, hoster_lbl);
        }

        public static unowned PreferencesWindow get_default(Application app)
        {
            if (s_instance == null)
                s_instance = new PreferencesWindow(app);

            return s_instance;
        }
    }
}
