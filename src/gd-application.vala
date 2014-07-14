/*
 * This file is part of PDownloader.
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


namespace GDownloader
{

    public class Application : Gtk.Application
    {
        
        /* Plugin Engines */
        public Plugins.CoreEngine core;
        public Plugins.HosterEngine hoster;

        public static const ActionEntry[] app_entries = {
            { "preferences",    on_preferences_activated    },
            { "quit",           on_quit_activated           }
        };

        public Application()
        {
            Object(application_id: "org.gdownloader");

            core = Plugins.CoreEngine.get_default();
            hoster = Plugins.HosterEngine.get_default();
        }

        public override
        void activate()
        {
            Gtk.Window window = active_window;

            if (window == null)
                window = new Window(this);

            window.show_all();
            window.present();
        }

        public override
        void startup()
        {
            base.startup();

            add_action_entries(app_entries, this);

            var builder = new Gtk.Builder.from_resource("/org/gdownloader/ui/menus.ui");

            if (GDownloader.Utils.show_appmenu()) {
                app_menu = builder.get_object("appmenu") as MenuModel;
            } 
        }

        private void on_preferences_activated()
        {
            var preferences = new Preferences(this);

            preferences.show_all();
            preferences.present();
        }

        private void on_quit_activated()
        {
            foreach(var window in get_windows().copy()) {
                window.destroy();
            }
        }
    }
}
