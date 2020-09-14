# 環境構築手順

$ bundle install
$ bundle exec rake db:create db:migrate
$ /usr/bin/supervisorctl restart app


## リバースプロキシについて
 - pumaはダウンしやすいため、nginxで負荷分散している

## supervisor起動方法
 - supervisor自身の起動
 $ /etc/init.d/supervisor start
 $ supervisord -c /etc/supervisor/supervisord.conf

 ## ポート占有確認
 $ sudo lsof -i:80
 $ ps ax | grep rails
 $ ps -ef | grep nginx
 $ ps aux | grep nginx
 $ nginx -s stop
 $ touch /var/run/nginx.pid
 $ touch /run/nginx.pid
 $ sudo touch /var/run/supervisor.sock
 $ sudo chmod 777 /var/run/supervisor.sock
 $ supervisorctl help stop
 ## supervisordの設定の「/var/run」を「/dev/shm」 に変更する
 $ sed -i "s/\/var\/run/\/dev\/shm/g" /etc/supervisor/supervisord.conf

 $ docker rm $(docker ps -aq)

 $ bundle exec puma -C ./config/puma.rb

 $ bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

$ /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf



