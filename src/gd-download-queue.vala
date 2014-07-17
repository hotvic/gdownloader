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

    public struct DownloadInfo
    {
        public int    id;
        public string filename;
        public string location;
        public string url;
        public string referer;
        public string ua;
        public string group;
    }

    public class DownloadQueue : Object
    {
        /**
         * This signal gets emitted when all downloads are complete.
         *
         * This signal is emitted when all downloads ''finish'',
         * i.e. there's no pending downloads on queue,
         * because they have finished or resulted in error.
         *
         * @since 0.1
         * @param this the instance of DownloadQueue
         * @return void
         */
        public signal void all_finished();

        /**
         * This signal gets emitted when a download is added to queue.
         *
         * @since 0.1
         * @param info info of the new download
         * @param this the instance of DownloadQueue
         * @return void
         */
        public signal void download_added(DownloadInfo info);

        /**
         * This signal gets emitted when a download is removed from queue.
         *
         * @since 0.1
         * @param info info of the removed download
         * @param this the instance of DownloadQueue
         * @return void
         */
        public signal void download_removed(DownloadInfo info);

        /* the queue */
        public Gee.LinkedList<DownloadInfo?> queue;


        public DownloadQueue()
        {
            queue = new Gee.LinkedList<DownloadInfo?>((Gee.EqualDataFunc) same_download);
        }

        public bool same_download(DownloadInfo a, DownloadInfo b)
        {
            if (a.url == b.url && a.location == b.location)
                return true;

            return false;
        }

        public void add_download(DownloadInfo info)
        {
            info.id = queue.size;
            queue.add(info);

            /* emit signal */
            download_added(info);
        }

        public void remove_download(DownloadInfo info)
        {
            queue.remove(info);

            /* emit signal */
            download_removed(info);
        }

        public void remove_download_by_id(int id)
        {
            foreach (var info in queue) {
                if (info.id == id)
                    remove_download(info);
            }
        }
        public void remove_download_by_filename(string filename)
        {
            foreach (var info in queue) {
                if (info.filename == filename)
                    remove_download(info);
            }
        }
    }
}
