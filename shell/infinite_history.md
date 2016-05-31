Add this to your .bash_profile (or .profile if you source that already in .bash_profile)

```sh
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
```

To search
```
grep -h logcat ~/.logs/bash-history-2016-04*
```

Source: https://spin.atomicobject.com/2016/05/28/log-bash-history/
