To skip say 1318 lines and take 424 lines from a file do below
```shell
tail -n +1318 your_file | head -n 424
```

More http://stackoverflow.com/questions/604864/print-a-file-skipping-x-lines-in-bash

In case you know start and end line numbers, you can do below

```
S=1318 E=1742; tail -n +$S your_file | head -n $(($E-$S))
```
