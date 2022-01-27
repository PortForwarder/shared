# はじめに・・・
pythonライブラリのパッケージに含まれるものを使ってデータベースにインポートしてあげる方法が「それっぽいサンプルデータがあって」種類も豊富で手っ取り早い。このデータは英語名表記のカラム名の為、そのまま入力データとしてアルゴリズムに組み込めたり、プロットしても凡例が豆腐(＝文字化け)することがないのがメリットである。日本語カラム名撲滅。

# 参考リンク
- 当方ブログ記事を参照 ： [SampleDataSet>>](https://qword.me/python/sample-data "SampleDataSet")
- ジェネレーター ： 
  - [generatedata.com>>](https://generatedata.com/ "generatedata.com")
  - [mockaroo.com>>](https://www.mockaroo.com/ "mockaroo.com")
- Rdatasets一式 ： [vincentarelbundockさん](https://github.com/vincentarelbundock "https://github.com/vincentarelbundock")が纏めてくれているもの、感謝してつかうべし
  - [Available datasets>>](https://vincentarelbundock.github.io/Rdatasets/articles/data.html "https://vincentarelbundock.github.io/Rdatasets/articles/data.html")

# 補足
本リポジトリに格納しているものは以下の基準で出力し保存している。

- pythonの描画ライブラリであるseabornや統計ライブラリのstatsmodelsから出力したものを一部加工して出力（感謝）
- ファイル末尾のsuffixの意味は以下。
  - _std >> 標準化済み(展開の都合上カテゴリカル変数もone-hot表現の上、標準化)
  - _minmax >> 正規化済み
- データ構造は配列ではなくテーブル形式 / 文字コードはutf-8です。

尚、URLダイレクトな読み込みは git の負荷軽減の為、ダウンロードして使うことを推奨しています。
とにかく前処理無しにすぐ使いたいという方は是非ご利用ください。特徴量をチューニングしている訳ではないので動作検証等に使うことを目的にしています。


# データセット内容
- affairs.csv : 不倫の有無と特徴量のデータセット、目的の変数を2値に加工したカラムはsuffiに _tf を付与。
- esoph.csv : 食道がんのデータセット。



