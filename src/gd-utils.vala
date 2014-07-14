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


namespace GDownloader.Utils
{
    
    public bool show_appmenu()
    {
        var settings = Gtk.Settings.get_default();

        return settings.gtk_shell_shows_app_menu && !settings.gtk_shell_shows_menubar;
    } 
}
