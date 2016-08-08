Apparently `%` is special character in crontab and stuff like date etc which use `%` to format breaks in cron! So escape `%` with `\`.

http://www.ducea.com/2008/11/12/using-the-character-in-crontab-entries/

http://unix.stackexchange.com/questions/29578/how-can-i-execute-date-inside-of-a-cron-tab-job

