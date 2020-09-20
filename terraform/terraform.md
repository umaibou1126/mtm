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

## ECRプッシュ
  - docker tag ca4b8e3a4857 umaibou1126/dev_app
  - docker images
  - docker push umaibou1126/dev_app
  - docker tag umaibou1126/dev_app:latest 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest
  - docker push 972418215193.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-test-20200919:latest


## git add取り消し
  - git rm --cached -r .

## git commit取り消し
  - git reset --soft HEAD^

