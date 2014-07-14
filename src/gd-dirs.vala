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

    class Dirs {
        public static string data_dir {
            get { return Config.PKGDATADIR; }
        }

        public static string locale_dir {
            get { return Config.LOCALEDIR; }
        }

        public static string lib_dir {
            get { return Config.PKGLIBDIR; }
        }

        public static string plugins_dir {
            owned get { return Path.build_filename(lib_dir, "plugins"); }
        }

        public static string plugins_data_dir {
            owned get { return Path.build_filename(data_dir, "plugins"); }
        }

        public static string hoster_plugins_dir {
            owned get { return Path.build_filename(plugins_dir, "hoster"); }    
        }

        public static string hoster_plugins_data_dir {
            owned get { return Path.build_filename(plugins_data_dir, "hoster"); }
        }

        public static string user_plugins_dir {
            owned get { return Path.build_filename(Environment.get_user_data_dir(), "gdownloader", "plugins"); }
        }

        public static string user_plugins_data_dir {
            owned get { return user_plugins_dir; }
        }

        public static string user_hoster_plugins_dir {
            owned get { return Path.build_filename(user_plugins_dir, "hoster"); }
        }

        public static string user_hoster_plugins_data_dir {
            owned get { return Path.build_filename(user_plugins_data_dir, "hoster"); }    
        }
    }
}
