To filter files with a pattern `ls *.c` is fine. But if you have huge number of files in current directory this fails.
```
ls | grep '\.c$'
```

Or simple regex search

```
ls | grep 'foo.*bar' # to list.
ls | grep 'foo.*bar' -c # to count.
```
