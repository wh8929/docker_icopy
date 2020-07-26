# docker_icopy

mongodb docker install 

1. `docker run -d --name mongo --network host -v /root/mongodb/db:/data/db wh89/newb:mongodb_alpine`
   if you using centos pls use `docker volume create mongodb`. then use mongodb replace /root/mongodb/db mount path.
  
2. `docker exec -ti mongo mongo admin /root/create_admin.js`

icopy docker install

1. confirm your rclone.conf path, will need it later.
2. first use make_config.sh to create icopy config file.
   ( need bot token, tg user id, fclone remote, mongodb link, mongodb user, mongodb pwd, sa folder path )
3. use create_docker.sh to create icopy docker. 
   ( need to type your rclone.conf path and sa folder path. default /root/.config/rclone/rclone.conf and /root/accounts )
