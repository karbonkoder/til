Extract host names, transform and ping them to check if alive.
```
... | grep '.xxx' | sort -u | ruby -ne 'puts $_[/([-\w\d]+).xxx/,1] + ".yyy"' | sort -u | xargs -L1 ping -c 3
```

Anagram verifier, sort characters of each words
```
cat words | ruby -ne 'puts $_.downcase.strip.chars.sort.join' | pbcopy
```
