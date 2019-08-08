# docker-ridff-backup

This simple container can be used to backup your server to a remote server that must have rdiff-backup installed which is accessed via SSH


## Docker run

```
docker run --rm -v /path/to/id.rsa/.ssh/:/root/.ssh/ -v /path/to/backup:/rdiff-backup aamservices/rdiff-backup rdiff-backup --remove-older-than 1M /rdiff-backup username@destination.server::/backup/destination/folder
      
```


## Docker Composer (run on a schedule or manually, I do this via portainer)

```
version: '2'
services:
  mysql:
    image: aamservices/rdiff-backup
    command: ["rdiff-backup", "--remove-older-than", "1M", "/rdiff-backup", "username@destination.server::/backup/destination/folder"]
    volumes:
      - /path/to/id.rsa/.ssh/:/root/.ssh/
      - /path/to/backup:/rdiff-backup
      
```



## Notes
You need to make sure that you have added id.rsa.pub to your destination server with copy-ssh-id or manually, you then just need to map the volume /path/to/id.rsa/.ssh/ to that id.rsa location, otherwise the ssh connection will always fail

