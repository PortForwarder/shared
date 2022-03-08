Treasure Data上でWorkflowを実行するBasicテンプレートです。

# 前提
- YAMLにおけるインデントは半角スペースです(Visual Studio Codeではタブが半角スペースに変換される)
- 各サービスの認証情報(SecretKey等)はTDコンソールより”Secret情報”として登録し変数として呼び出します(ベタ貼り禁止)
- 標準パラメーター(export/local/store)のうち優先されるのはlocalパラメーターです。[参考リンク>>](https://docs.digdag.io/concepts.html?highlight=export#export-and-store-parameters)
- customscript内で立ち上がるDockerに関しては右記エイリアスを参照 [参考リンク>>](https://hub.docker.com/r/digdag/digdag-python/tags)


# ドキュメント
詳しくは下記のDocsを参照。CLIからの操作はtoolbeltをインストールして実行してください。
- https://docs.treasuredata.com/display/public/PD/Product+Documentation+Home
- https://docs.digdag.io/operators/td_ddl.html
- https://pytd-doc.readthedocs.io/en/latest/generated/pytd.Client.html
- https://docs.treasuredata.com/display/public/PD/TD+Toolbelt+Reference
- https://toolbelt.treasuredata.com/

# 組み込み変数
変数は ${var} で利用できます。また以下のように標準の組み込み変数を利用することが出来ます。

| Name                 | Description                           | Example                              |
|----------------------|---------------------------------------|--------------------------------------|
| timezone             | Timezone of this workflow             | America/Los_Angeles                  |
| project_id           | The project ID of this workflow       | 12345                                |
| session_uuid         | Unique UUID of this session           | 414a8b9e-b365-4394-916a-f0ed9987bd2b |
| session_id           | Integer ID of this session            | 2381                                 |
| session_time         | Time of this session with time zone   | 2016-01-30T00:00:00-08:00            |
| session_date         | Date part of session_time             | 2016/1/30                            |
| session_date_compact | Date part of session_time (compact)   | 20160130                             |
| session_local_time   | Local time format of session_time     | 2016/1/30 0:00                       |
| session_tz_offset    | Time zone offset part of session_time | -800                                 |
| session_unixtime     | Seconds since the epoch time          | 1454140800                           |
| task_name            | Name of this task                     | +my_workflow+parent_task+child_task0 |
| attempt_id           | Integer ID of this attempt            | 7                                    |

| Name                           | Example (hourly schedule) | Example (daily schedule)  |
|--------------------------------|---------------------------|---------------------------|
| last_session_time              | 2016-01-29T23:00:00-08:00 | 2016-01-29T00:00:00-08:00 |
| last_session_date              | 2016/1/29                 | 2016/1/29                 |
| last_session_date_compact      | 20160129                  | 20160129                  |
| last_session_local_time        | 2016/1/29 23:00           | 2016/1/29 0:00            |
| last_session_tz_offset         | -800                      | -800                      |
| last_session_unixtime          | 1454137200                | 1454054400                |
| last_executed_session_time     | 2016-01-29T23:00:00-08:00 | 2016-01-29T00:00:00-08:00 |
| last_executed_session_unixtime | 1454137200                | 1454054400                |
| next_session_time              | 2016-01-30T01:00:00-08:00 | 2016-01-31T00:00:00-08:00 |
| next_session_date              | 2016/1/30                 | 2016/1/31                 |
| next_session_date_compact      | 20160130                  | 20160131                  |
| next_session_local_time        | 2016/1/30 1:00            | 2016/1/31 0:00            |

[参考リンク>>](https://docs.digdag.io/workflow_definition.html#using-variables)

