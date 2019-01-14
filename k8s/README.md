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

### helmでローカルのchartをデプロイ

アプリケーションのソースコードの変更を即座にコンテナに反映させるため、ローカルのマシンのディレクトリをマウントするための設定を`values/development.yaml`に書く。

```diff
  mountPath: /app
  # FIXME: Set the path to your local Rails application root directory
-  hostPath: /Users/takmnagaya/projects/rails-k8s-sampleapp
+  hostPath: /path/to/your/projects/rails-k8s-sampleapp
```

    helm install --name development . -f values/development.yaml # 初回のみ
    helm upgrade --install development . -f values/development.yaml

#### デプロイしたリソースの削除

    helm delete --purge development
