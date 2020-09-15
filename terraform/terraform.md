## 秘密鍵・公開鍵作成
$ ssh-keygen -t rsa -f example -N ''

## variables.td
  - tfファイルで使用する変数を定義

## terraform.tfvars
  - 変数の中身を記載する
    - aws_access_key="xxxxxxxxxxxxx"
    - aws_secret_key="xxxxxxxxxxxxx"
    - region="ap-northeast-1"
