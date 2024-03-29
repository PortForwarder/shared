Treasure Data上でWorkflowを実行するBasicテンプレートです。

# 前提知識
- 設定ファイルの拡張子は.dig で記述ルールはYAML形式です。インデントは半角スペース。VS CodeでSyntax Highlightが可能なプラグインが配布されています。
  - https://marketplace.visualstudio.com/items?itemName=msysyamamoto.vscode-digdag 
- 各サービスの認証情報(SecretKey等)はTDコンソールより”Secret情報”として登録し変数として呼び出します(ベタ貼り禁止)
  - コンソールで登録：<br> ![SecretKey](https://user-images.githubusercontent.com/61743001/174243804-c68fa61b-840f-4782-94a7-c837c0940c3d.jpg)<br>
  - YAML内で呼び出す： ["TD_API_KEY"] 
- 標準パラメーター(export/local/store)のうち優先されるのはlocalパラメーターです。[参考リンク>>](https://docs.digdag.io/concepts.html?highlight=export#export-and-store-parameters)
- DockerのRAM/Storageには制限があるため、RAMに乗り切らない処理は別のパイプラインを考えましょう(上位プランもあります)、OSは言わずもがなですがLinuxとなっています。
- Webコンソール上の各種WorkflowファイルではショートカットCommandが利用できます。
  - コメントアウトの有効・解除： Command(Control) ＋ / 
  - インデントの解除： Shift ＋ Tab ※VS Codeと一緒です。
  - .digファイル内で、参照しているファイル(.sql)ファイルなどを開く
    - 別タブで開く： リンクのPathを選択しながら Shift ＋ Click
    - 同一ウインドウで移動： リンクのPathを選択しながら　Command(Control) ＋ Click
# ドキュメント
詳しくは下記のDocsを参照。CLIからの操作はtoolbeltをインストールして実行してください。
digdagはOSSで公開されており、TD Workflowエンジンにも組み込まれていますが、一部TD CDP独自のオペレーターなどが存在します。

- https://www.digdag.io/
- https://docs.treasuredata.com/display/public/PD/Product+Documentation+Home
- https://docs.digdag.io/operators/td_ddl.html
- https://pytd-doc.readthedocs.io/en/latest/generated/pytd.Client.html
- https://docs.treasuredata.com/display/public/PD/TD+Toolbelt+Reference
- https://toolbelt.treasuredata.com/

# ユーザー定義変数と組み込み変数
ユーザー定義変数は _export:内で宣言し `${YourVarName}` で呼び出すことができます。また以下のように標準の組み込み変数(built-in variables)を `${session_id}` といった記述を用い利用することが出来ます。組み込み関数は以下。

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

また session_time は 以下のような moment().format() 式で希望の形に整形してフォーマットすることができる。


```time_format.ymal
timezone: America/Los_Angeles

+format_session_time:
  # "2016-09-24 00:00:00 -0700"
  echo>: ${moment(session_time).format("YYYY-MM-DD HH:mm:ss Z")}

+format_in_utc:
  # "2016-09-24 07:00:00"
  echo>: ${moment(session_time).utc().format("YYYY-MM-DD HH:mm:ss")}

+format_tomorrow:
  # "September 24, 2016 12:00 AM"
  echo>: ${moment(session_time).add(1, 'days').format("LLL")}

+get_execution_time:
  # "2016-09-24 05:24:49 -0700"
  echo>: ${moment().format("YYYY-MM-DD HH:mm:ss Z")}
```

# pythonライブラリ
customscript内では裏側でDockerが立ち上がっていますが、[エイリアス>>](https://hub.docker.com/r/digdag/digdag-python/tags)に存在する「digdag/digdag-python」を確認すれば構成内容を確認できる。例えばpip listすればpythonにインストールしているライブラリが確認が可能。(執筆時点ではscikit-learn,lightgbm等88のライブラリが確認できました)。

>python

Python 3.9.15 (main, Nov 15 2022, 21:59:29) 


>pip list

| Package               | Version   |
|-----------------------|-----------|
| alembic               | 1.5.8     |
| attrs                 | 20.3.0    |
| boto3                 | 1.15.18   |
| botocore              | 1.18.18   |
| certifi               | 2020.12.5 |
| chardet               | 4.0.0     |
| click                 | 7.1.2     |
| cliff                 | 3.5.0     |
| cloudpickle           | 1.6.0     |
| cmaes                 | 0.8.2     |
| cmd2                  | 1.5.0     |
| cmdstanpy             | 0.9.5     |
| colorama              | 0.4.4     |
| colorlog              | 4.8.0     |
| convertdate           | 2.2.0     |
| cycler                | 0.10.0    |
| Cython                | 0.29.22   |
| decorator             | 4.4.2     |
| ephem                 | 3.7.7.1   |
| fbprophet             | 0.7.1     |
| future                | 0.18.2    |
| futures               | 3.1.1     |
| greenlet              | 1.0.0     |
| holidays              | 0.10.4    |
| hyperopt              | 0.2.5     |
| idna                  | 2.1       |
| iniconfig             | 1.1.1     |
| jmespath              | 0.10.0    |
| joblib                | 1.0.1     |
| kiwisolver            | 1.3.1     |
| korean-lunar-calendar | 0.2.1     |
| lightgbm              | 3.2.0     |
| LunarCalendar         | 0.0.9     |
| Mako                  | 1.1.4     |
| MarkupSafe            | 1.1.1     |
| matplotlib            | 3.4.1     |
| memory-profiler       | 0.58.0    |
| msgpack               | 1.0.2     |
| networkx              | 2.5.1     |
| nltk                  | 3.5       |
| numpy                 | 1.20.2    |
| optuna                | 2.7.0     |
| packaging             | 20.9      |
| pandas                | 1.2.3     |
| pbr                   | 5.5.1     |
| Pillow                | 8.2.0     |
| pip                   | 22.0.2    |
| plotly                | 4.14.3    |
| pluggy                | 0.13.1    |
| presto-python-client  | 0.7.0     |
| prettytable           | 0.7.2     |
| psutil                | 5.8.0     |
| py                    | 1.10.0    |
| py4j                  | 0.10.9    |
| pyarrow               | 3.0.0     |
| PyMeeus               | 0.5.11    |
| pyparsing             | 2.4.7     |
| pyperclip             | 1.8.2     |
| pyspark               | 3.1.1     |
| pystan                | 2.19.1.1  |
| pytd                  | 1.4.0     |
| pytest                | 6.2.3     |
| python-dateutil       | 2.8.1     |
| python-editor         | 1.0.4     |
| pytz                  | 2019.3    |
| PyYAML                | 5.4.1     |
| regex                 | 2021.4.4  |
| requests              | 2.25.1    |
| retrying              | 1.3.3     |
| s3transfer            | 0.3.6     |
| scikit-learn          | 0.24.1    |
| scipy                 | 1.6.2     |
| seaborn               | 0.11.1    |
| setuptools            | 58.1.0    |
| setuptools-git        | 1.2       |
| simplejson            | 3.17.2    |
| six                   | 1.15.0    |
| SQLAlchemy            | 1.4.5     |
| stevedore             | 3.3.0     |
| td-client             | 1.2.1     |
| td-pyspark            | 21.3.0    |
| td-pyspark-ea         | 20.12.0   |
| threadpoolctl         | 2.1.0     |
| toml                  | 0.10.2    |
| tqdm                  | 4.60.0    |
| urllib3               | 1.24.3    |
| wcwidth               | 0.2.5     |
| wheel                 | 0.37.1    |

ライブラリが存在しない場合、存在するがアップデートしたい場合は.pyファイル内でアップデートすることができます。
 
```:pip_install.py
import os
os.system(f"{sys.executable} -m pip install --user scikit-learn==0.24.2")
os.system(f"{sys.executable} -m pip install --upgrade scikit-learn==0.24.2")
```

※セキュリティの観点から立ち上がっているDockerLinux上で sudo でログインすることはできません。ユーザー権限で内で実行できるScriptでしたら一般的なOSと同様に操作することが可能です。

※メモリ・ストレージ領域ともに契約内容によって異なりますので、スペックに見合ったパイプラインを心がけましょう。
