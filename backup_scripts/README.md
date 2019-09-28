#Notes on how to use cron/crontab

To set up the crontab for these scripts check out:

- [How to set up a cron bash script](https://ole.michelsen.dk/blog/schedule-jobs-with-crontab-on-mac-osx.html)

- [How to sync Photos Library](https://kevingoedecke.me/2015/08/30/backup-mac-photos-library-with-rsync-over-ssh/)

Crontab reference

```bash
* * * * *  command to execute
│ │ │ │ │
│ │ │ │ └─── day of week (0 - 6) (0 to 6 are Sunday to Saturday, or use names; 7 is Sunday, the same as 0)
│ │ │ └──────── month (1 - 12)
│ │ └───────────── day of month (1 - 31)
│ └────────────────── hour (0 - 23)
└─────────────────────── min (0 - 59)
```

To see current cron jobs:
`crontab -l`

To add a new one:
`env EDITOR=vi crontab -e`

To set the right permissions:
`chmod ug+x example.sh`