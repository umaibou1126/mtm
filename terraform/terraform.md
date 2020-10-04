## 秘密鍵・公開鍵作成
$ ssh-keygen -t rsa -f example -N ''

## variables.td
  - tfファイルで使用する変数を定義

## terraform.tfvars
  - 変数の中身を記載する
    - aws_access_key="xxxxxxxxxxxxx"
    - aws_secret_key="xxxxxxxxxxxxx"
    - region="ap-northeast-1"

## tfファイルフォーマット
$ terraform fmt

## エラー：
Error loading state:AccessDenied: Access Denied
  - ./terraform全消し

## dockerコンテナ削除
 - $ docker rm -f `docker ps -a -q`

## dockerイメージ削除
 - $ docker rmi `docker images -q`
<<<<<<< HEAD

 ## dockerイメージ作成
 - $ docker build -f docker/prod/app/Dockerfile -t production_20200930 .

=======
# dockerイメージ作成
- $ docker build -f docker/prod/app/Dockerfile -t production_10032218 .
>>>>>>> 341d19adbcb1b503a97126c0fa3789a1789c057e

## ECRプッシュ
  - docker tag ca4b8e3a4857 umaibou1126/prod_app-8
  - docker images
  - docker push umaibou1126/prod_app
  - docker tag umaibou1126/prod_app:latest 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest
  - docker push 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest


## git add取り消し
  - git rm --cached -r .

## git commit取り消し
  - git reset --soft HEAD^


## EC2 RDS接続
 - RDSセキュリティグループで3306 0.0.0.0/0を空ける
$ mysql -h terraform-rds.cwmmfqrwq6x1.ap-northeast-1.rds.amazonaws.com -P 3306 -u test -p
 - test/password


 ## ENV database.yml export

 $ export RAILS_DATABASE_USERNAME=test
 $ export RAILS_DATABASE_PASSWORD=password
 $ export RAILS_DATABASE_HOST=terraform-rds.cwmmfqrwq6x1.ap-northeast-1.rds.amazonaws.com
 $ export RAILS_DATABASE_PORT=3306

## EC2インストール

 - sudo yum install git
 - yum list installed | grep mariadb
 - sudo yum remove mariadb-libs
 - sudo yum-config-manager --disable mysql57-community
 - sudo yum-config-manager --enable mysql80-community
 - sudo yum install -y mysql-community-client
 - mysql --version


# production環境
 - $ bundle exec rails db:migrate RAILS_ENV=production


 # vscode プラグインインストール
  - $ code --list-extensions | xargs -L 1 echo code --install-extension

# アセットプリコンパイル
 - $ bundle exec rake assets:precompile RAILS_ENV=production

## EC2インストール

 - sudo yum install git
 - yum list installed | grep mariadb
 - sudo yum remove mariadb-libs
 - sudo yum-config-manager --disable mysql57-community
 - sudo yum-config-manager --enable mysql80-community
 - sudo yum install -y mysql-community-client
 - mysql --version


# digコマンド
