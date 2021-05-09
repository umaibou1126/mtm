
## 構成図

![構成図-Page-1 (2)](https://user-images.githubusercontent.com/57199117/96358171-15209200-113f-11eb-8291-931e2a0481db.png)

### バックエンド

 - Ruby 2.7.1
 - Rails 6.0.2
 - MySQL 5.7
 - Nginx 1.19.0

### フロントエンド

 - Vue.js 2.6.1
 - Vue-CLI 4.4.1

### インフラ
 - CircleCI：ECSデプロイ
 - Terraform（ECS | ALB | RDS | VPC | ACM ）
 - AWS（ECS | ECR  |  RDS |  VPC  |  ALB  |  ACM  |  Route53  | IAM ）
 - Docker | Docker Compose


 - [サービスメッシュを使ってみよう](https://thinkit.co.jp/article/17875)
 - [Istioは何ができるか](https://qiita.com/sheepland/items/4f6c4b880d0bc6a51f85)
 - [マイクロサービスアーキテクチャ向けにサービスメッシュを提供する「Istio」の概要と環境構築、トラフィックルーティング設定](https://knowledge.sakura.ad.jp/20489/)
 - [Envoyでサービスメッシュを作ろう](https://qiita.com/rerorero/items/0eea0e02955950dd85fc)

 - kubeconfig更新
 ```
 $ aws eks --region ap-northeast-1 update-kubeconfig --name eks-example
 $ kubectl get pods --all-namespaces  // 確認
 ```

 - namespace変更コマンド

 ```
 $ kubectl config set-context $(kubectl config current-context) --namespace=mynamespace
 $ kubectl config get-contexts
 $ kubectl create namespace sample
 $ kubectl delete namespace sample
 ```

 - ラベル関連コマンド

 ```
 $ kubectl get pod --show-labels
 $ kubectl label pods nginx my-label=hello
 $ kubectl label pods nginx my-label-
```

- エンドポイント確認

```
$ kubectl get endpoints
```

- サービス確認

```
$ kubectl get service
```

 - サイドカーインジェクションを有効にする

 ```
 $ kubectl label namespace default istio-injection=enabled
 $ kubectl get namespace -L istio-injection  // 確認
 ```

 - サービスメッシュ：マイクロサービス間の依存関係・トラフィックを制御する仕組み
 - サイドカー：マイクロサービス間のコミュニケーションを行うプロキシ
 - 各pod単位に寄生させるL4/L7対応のプロキシコンテナ
 - サーキット・ブレーカ：依存関係に起因する障害の連鎖を防ぐ仕組み
 - DestinationRule：ルーティング先に対して、keep-aliveを設定する
 - Virtual Service：サービスメッシュ内のルーティングを設定する
