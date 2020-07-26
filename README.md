# docker_icopy

if you using centos pls open /etc/sysconfig/selinux file and change the SELINUX=enforcing to permissive then reboot. 

mongodb docker install 

1. `docker run -d --name mongo --network host -v /root/mongodb/db:/data/db wh89/newb:mongodb_alpine`
  
2. `docker exec -ti mongo mongo admin /root/create_admin.js`

icopy docker install

1. confirm your rclone.conf path, will need it later.
2. first use make_config.sh to create icopy config file.
   ( need bot token, tg user id, fclone remote, mongodb link, mongodb user, mongodb pwd, sa folder path )
3. use create_docker.sh to create icopy docker. 
   ( need to type your rclone.conf path and sa folder path. default /root/.config/rclone/rclone.conf and /root/accounts )

* if want to upgrade icopy verion use `docker exec -ti icopy apk add git && git pull` 

icopy and mongodb docker install

1. follow icopy docker install step 1 and 2.

2. use start_icopy.sh to start docker.


p.s. if you want change mongodb user and password, then you need to edit create_admin.js and conf.toml.