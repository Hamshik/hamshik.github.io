#
# Regular cron jobs for the debfile package.
#
0 4	* * *	root	[ -x /usr/bin/debfile_maintenance ] && /usr/bin/debfile_maintenance
