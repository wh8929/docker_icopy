#!/bin/bash
create_icopy_config() {
        curl -L -o conf.toml.example https://github.com/fxxkrlab/iCopy/raw/master/config/conf.toml.example
        mv conf.toml.example conf.toml
        read -e -p "是否使用本地mongodb? [Y/n] :" yn
        [[ -z "${yn}" ]] && yn="y"
        if [[ $yn == [Yy] ]]; then
                sed -i 's/ = "mongodb+srv"/ = "mongodb"/g' conf.toml
        fi

        read -p "请输入BOT TOKEN / pls type your bot token: " bottoken
        sed -i "s/Bot API Token HERE/$bottoken/g" conf.toml
        read -p "请输入个人TG的ID / pls type your user id: " myid
        sed -i "s/user id HERE/$myid/g" conf.toml
        read -p "请输入fclone配置名 (比如gc) / pls type your remote name: " remote
        sed -i 's/ = ""/ = "'$remote'"/g' conf.toml
        read -p "请输入mongodb数据库连接 (本地数据库链接为 localhost ): " mongodblink
        sed -i "s#Your database address here#$mongodblink#g" conf.toml
        read -p "请输入mongodb数据库的用户 (回车默认icopy): " mongodbuser
		if [ -z "${mongodbuser}" ]; then
                mongodbuser=icopy
        fi
        sed -i "s/Your mongodb user_Name HERE/$mongodbuser/g" conf.toml
        read -p "请输入mongodb数据库的密码 (回车默认icopy222): " mongodbpwd
		if [ -z "${mongodbpwd}" ]; then
                mongodbpwd=icopy222
        fi
        sed -i "s/Your mongodb user_Passwd HERE/$mongodbpwd/g" conf.toml
        read -p "请输入sa文件夹，结尾不要加\ (回车默认/root/accounts): " safolder
		if [ -z "${safolder}" ]; then
                safolder=/root/accounts
        fi
        sed -i 's# = "/root/accounts"# = "'$safolder'"#g' conf.toml
}

echo && echo -e " 开始创建iCopy0.2的conf.toml "

if [ ! -f /root/.config/rclone/rclone.conf ]; then
    echo "rclone.conf 不存在. 请先创建rclone.conf再回来使用."
else
        create_icopy_config

fi
