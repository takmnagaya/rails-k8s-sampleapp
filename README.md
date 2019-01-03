
# 開発環境セットアップ

## DB作成、マイグレーション実行

    $ kubectl create -f k8s/jobs/db-create-migrate.yaml # 数秒でJobが自動実行される
    $ pods=$(kubectl get pods --selector=job-name=rails-db-create-migrate --output=jsonpath={.items..metadata.name}) && \
      kubectl logs $pods # 実行結果のログを確認する
