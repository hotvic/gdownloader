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


namespace GDownloader.Plugins {

    public class HosterEngine : Peas.Engine {
        
        private static HosterEngine s_instance;

        public HosterEngine()
        {
            enable_loader("python3");

            add_search_path(Dirs.hoster_plugins_dir, Dirs.hoster_plugins_data_dir);
            add_search_path(Dirs.user_hoster_plugins_dir, Dirs.user_hoster_plugins_data_dir);

            var repo = GI.Repository.get_default();

            try {
                repo.require("Peas", "1.0", 0);
                repo.require("PeasGtk", "1.0", 0);
            }
            catch (Error e) {
                warning("Could not load repository: %s", e.message);
                return;
            }
        }

        public new static unowned HosterEngine get_default()
        {
            if (s_instance == null) {
                s_instance = new HosterEngine();
            }

            return s_instance;
        }

        public static void initialize()
        {
            get_default();
        }
    }
}
