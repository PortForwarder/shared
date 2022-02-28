# 目的
TableauDesktopでTreasure Data CDPに接続する。


# 環境
- MacOS：Bic Sur(11.0.1)
- TableauDesktop Professional：2021.2.5
 
# 事前準備
最新のドライバーはprestoドライバーでなくtrinoドライバーとなっているので注意。Documentsに記載の通りTableauのバージョンが古い場合はprestoドライバーで動作する。
前提としてJDBCドライバーはJavaが必要なので入れておく。
 - https://www.tableau.com/ja-jp/support/releases
 - https://prestodb.io/download.html
 - https://www.java.com/ja/download/help/download_options_ja.html
 	- https://www.tableau.com/support/drivers
 	- https://trino.io/docs/current/installation/jdbc.html

# Tableauの設定
1. データに接続 >> Presto を選択　※Prestoがない場合は「データに接続 >> その他 >> Presto等にある。
1. Windowが表れるので以下の用に記入して接続する。

- サーバー： api-presto.treasuredata.co.jp　OR  api-presto.treasuredata.com ※利用しているリージョンを選択
- ポート： 443
- カタログ：td-presto
- スキーマ：空でOK
- ユーザー名： Treasure Data CDP で発行されるAPIキー ※取り扱い注意
- SSLが必要のチェックをONにする

![tableau_presto_api](https://user-images.githubusercontent.com/61743001/155908611-dafac332-13d5-43a2-8062-a2db80233e52.jpg)


以上でアクセス完了です。

参考)
https://docs.treasuredata.com/display/public/INT/Tableau+Desktop+for+Mac
