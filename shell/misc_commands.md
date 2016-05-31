Login as root `sudo -s`

Untar gz files `tar -zxvf backup.tar.gz`

RSync files 
```
nohup rsync -av --progress /source/folder/ /dest/folder/ &
tail -f nohup.out # to watch progress
```
