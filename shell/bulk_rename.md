To bulk rename say scanned images from xerox machine

```
i=0; for f in pattern*.pdf; do mv "$f" "Yay$i.pdf"; ((i++)) ; done
```
