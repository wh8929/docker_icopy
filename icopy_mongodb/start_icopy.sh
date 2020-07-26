#!/bin/bash

if [ ! "$(docker ps -a -q -f name=icopy)" ]; then
        echo -e "创建icopy docker"
        read -p "请输入rclone.conf的位置, 回车使用默认: " rclone_conf
        if [ -z "${rclone_conf}" ]; then
                rclone_conf=/root/.config/rclone/rclone.conf
        fi

        read -p "请输入sa文件夹位置, 回车使用默认: " sa_folder
        if [ -z "${sa_folder}" ]; then
                sa_folder=/root/accounts
        fi


        if [ ! -f $rclone_conf ]; then
            echo " 请确认rclone.conf在设定位置 "
            exit 1
        else
            if ! ls -A $sa_folder/*.json > /dev/null 2>&1; then
                echo " $sa_folder 文件夹没有sa文件 "
                exit 1
            else
                docker run --restart=always -d --network host --name icopy \
                    -v /root/mongodb:/data/db \
                    -v $rclone_conf:/root/.config/rclone/rclone.conf \
                    -v $sa_folder:/root/accounts \
                    -v $(pwd)/conf.toml:/root/iCopy/config/conf.toml \
                    -w /root/iCopy \
                    wh89/newb:icopy_mongodb && \

                docker exec -d icopy mongo admin /root/create_admin.js && \
                docker exec -d icopy python3 iCopy.py
            fi
        fi

else
        if [ "$(docker ps -aq -f status=exited -f name=icopy)" ]; then
                docker start icopy && \
                docker exec -d icopy python3 iCopy.py
                echo -e " 启动成功 "
        fi

fi
