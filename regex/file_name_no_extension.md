Get file name without extension

```
(.+?)(\.[^.]*$|$)
```

Usage:
```
find . | ruby -ne 'puts $_.split("/").last[/(.+?)(\.[^.]*$|$)/,1]' | sort -u > uniq_names
```

Source: http://stackoverflow.com/questions/624870/regex-get-filename-without-extension-in-one-shot
