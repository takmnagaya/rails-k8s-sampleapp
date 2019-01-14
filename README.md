
# 開発環境セットアップ

## DB作成、マイグレーション実行

    $ kubectl create -f k8s/jobs/db-create-migrate.yaml # 数秒でJobが自動実行される
    $ pods=$(kubectl get pods --selector=job-name=rails-db-create-migrate --output=jsonpath={.items..metadata.name}) && \
      kubectl logs $pods # 実行結果のログを確認する

## Railsコンテナでのコマンド実行
`rails g`コマンドなどを実行する場合、コンテナにログインする。

    pod=sample-** # Railsが動いているコンテナが存在するPodを指定
    kubectl exec -it $pod --container rails -- sh
    # rails g controller hoge
    exit
