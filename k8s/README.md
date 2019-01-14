# k8sのデプロイ

## 開発環境の構築
### ダッシュボードなどの準備
開発の助けになる。
See [kubernetes 準備編](http://takmnagaya.hatenablog.com/entry/2019/01/01/155147)
### ingress-nginxの設定
初回のみ実行する必要がある。

See [kubernetes/ingress-nginx/blob/master/docs/deploy/index.md](https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/index.md)

    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
    $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/cloud-generic.yaml

### helmのインストール

### helmを利用してローカルのchartをデプロイ

    helm install --name development . -f values/development.yaml # 初回のみ
    helm upgrade --install development . -f values/development.yaml

#### デプロイしたリソースの削除

    helm delete --purge development
