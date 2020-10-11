## terraform
  - 秘密鍵・公開鍵作成
    - $ ssh-keygen -t rsa -f example -N ''

  - variables.td
    - tfファイルで使用する変数を定義

  - terraform.tfvars
    - 変数の中身を記載する
    - aws_access_key="xxxxxxxxxxxxx"
    - aws_secret_key="xxxxxxxxxxxxx"
    - region="ap-northeast-1"

  - tfファイルフォーマット
    - $ terraform fmt

  - エラー：
    - Error loading state:AccessDenied: Access Denied
    - ./terraform全消し

## docker
  - devコンテナ内作業
    - $ bundle install
    - $ bundle exec rake db:create db:migrate
    - $ /usr/bin/supervisorctl restart app

  - dockerコンテナ削除
    - $ docker rm -f `docker ps -a -q`

  - dockerイメージ削除
    - $ docker rmi `docker images -q`

  - dockerイメージ作成
    - $ docker build -f docker/prod/app/Dockerfile -t production_app_1004 .

  - ECRプッシュ
    - docker tag ca4b8e3a4857 umaibou1126/prod_app-8
    - docker images
    - docker push umaibou1126/prod_app
    - docker tag umaibou1126/prod_app:latest 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest
    - docker push 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest


## git
  - git add取り消し
    - git rm --cached -r .

  - git commit取り消し
    - git reset --soft HEAD^

## AWS
  - EC2 RDS接続
    - RDSセキュリティグループで3306 0.0.0.0/0を空ける
    - $ mysql -h terraform-rds.cwmmfqrwq6x1.ap-northeast-1.rds.amazonaws.com -P 3306 -u test -p
    - test/password

  - EC2インストール
    - sudo yum install git
    - yum list installed | grep mariadb
    - sudo yum remove mariadb-libs
    - sudo yum-config-manager --disable mysql57-community
    - sudo yum-config-manager --enable mysql80-community
    - sudo yum install -y mysql-community-client
    - mysql --version



## production作成作業
  - production用データベース作成
    - $ bundle exec rails db:migrate RAILS_ENV=production


  - アセットプリコンパイル
    - $ bundle exec rake assets:precompile RAILS_ENV=production

  - ENV database.yml export
    - $ export RAILS_DATABASE_USERNAME=test
    - $ export RAILS_DATABASE_PASSWORD=password
    - $ export RAILS_DATABASE_HOST=terraform-rds.cwmmfqrwq6x1.ap-northeast-1.rds.amazonaws.com
    - $ export RAILS_DATABASE_PORT=3306


## ミドルウェア
  - リバースプロキシについて
    - pumaはダウンしやすいため、nginxで負荷分散している

  - supervisorコマンド
    - supervisor起動
    - $ /etc/init.d/supervisor start
    - $ supervisord -c /etc/supervisor/supervisord.conf

  - supervisorのsocketコマンド
    - $ sudo touch /var/run/supervisor.sock
    - $ sudo chmod 777 /var/run/supervisor.sock
    - $ supervisorctl help stop

  - supervisordの設定の「/var/run」を「/dev/shm」 に変更する
    - $ sed -i "s/\/var\/run/\/dev\/shm/g" /etc/supervisor/supervisord.conf

  - nginxコマンド
    - ポート確認
    - $ ps -ef | grep nginx
    - $ ps aux | grep nginx

  - nginx停止コマンド
    - $ nginx -s stop

  - PID関連コマンド
    - $ touch /var/run/nginx.pid
    - $ touch /run/nginx.pid


  - ポート占有確認
    - $ sudo lsof -i:80
    - $ ps ax | grep rails


  - puma起動
    - $ bundle exec puma -C config/puma.rb
    - $ bundle exec pumactl start

  - nginx / puma同時起動
    - $ bundle exec puma -d && \
    /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
    - $ /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

  - mysql2エラー
    - $ bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"

  - cssが反映されない
    - config/environments/development.rb
    - config.assets.debug = true　→ falseに変更


## vscode プラグインインストール
  - $ code --list-extensions | xargs -L 1 echo code --install-extension


## CircleCI
  - config.ymlのチェック
    - $ yamllint .circleci/config.yml
    - $ circleci orb validate .circleci/config.yml
    - $ circleci local execute -c .circleci/config.yml --job build
    - $ circleci build --job rspec .circleci/config.yml
    - $ circleci build --job deploy_app .circleci/config.yml
    - $ circleci build --job aws-ecr/build-and-push-image .circleci/config.yml
    - CircleCIのAdvanced SettingsのPass secrets to builds from forked pull requestsがOff

