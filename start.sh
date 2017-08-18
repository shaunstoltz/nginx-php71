#!/bin/sh
#########################################################################
# File Name: start.sh
# Author: Skiychan
# Email:  dev@skiy.net
# Version:
# Created Time: 2015/12/13
#########################################################################
Nginx_Install_Dir=/usr/local/nginx
DATA_DIR=/data/www

set -e
chown -R www.www $DATA_DIR

if [[ -n "$EXE_SCRIPT" ]]; then

    if [ -z "$EXE_SCRIPT_DIR" ]; then
        echo >&2 'error:  missing EXE_SCRIPT_DIR'
        echo >&2 '  Did you forget to add -e EXE_SCRIPT_DIR=... ?'
        exit 1
    fi

    cp $EXE_SCRIPT_DIR/$EXE_SCRIPT ./$EXE_SCRIPT

    chmod +x ./$EXE_SCRIPT

    ./$EXE_SCRIPT
fi

/usr/bin/supervisord -n -c /etc/supervisord.conf
