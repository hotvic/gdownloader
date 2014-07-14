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


namespace GDownloader
{

    [GtkTemplate (ui = "/org/gdownloader/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        /* Child widgets */
        [GtkChild]
        public Gtk.MenuButton gears_menu;
        [GtkChild]
        public Gtk.TreeView down_queue_tv;
        [GtkChild]
        public Gtk.TreeView grabber_queue_tv;
        

        public Window(Application app)
        {
            Object(application: app);

            var builder = new Gtk.Builder.from_resource("/org/gdownloader/ui/menus.ui");

            // Set gears menu Model
            gears_menu.set_menu_model(builder.get_object("gearsmenu") as MenuModel);

            // Insert Download Queue's columns
            down_queue_tv.insert_column_with_attributes(-1, "Name", new Gtk.CellRendererText(), "text", 0, null); 
            down_queue_tv.insert_column_with_attributes(-1, "Size", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "Hoster", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "State", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "Speed", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "ETA", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "Downloaded", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "Progress", new Gtk.CellRendererText(), "text", 0, null);
            down_queue_tv.insert_column_with_attributes(-1, "Localtion", new Gtk.CellRendererText(), "text", 0, null);
            
            // Insert Link Grabber's columns
            grabber_queue_tv.insert_column_with_attributes(-1, "Name", new Gtk.CellRendererText(), "text", 0, null); 
            grabber_queue_tv.insert_column_with_attributes(-1, "Size", new Gtk.CellRendererText(), "text", 0, null);
            grabber_queue_tv.insert_column_with_attributes(-1, "Hoster", new Gtk.CellRendererText(), "text", 0, null);
            grabber_queue_tv.insert_column_with_attributes(-1, "Status Code", new Gtk.CellRendererText(), "text", 0, null);
            grabber_queue_tv.insert_column_with_attributes(-1, "Localtion", new Gtk.CellRendererText(), "text", 0, null);
        }
    }
}
