# はじめに・・・
サンプルデータについてpythonライブラリのパッケージに含まれるものを使うと「それっぽい変数が用意されており」種類も豊富で手っ取り早い。このデータは英語名表記のカラム名の為、そのまま入力データとしてアルゴリズムに組み込めたり、プロットしても凡例が豆腐(＝文字化け)することがないのがメリットである。日本語カラム名撲滅。

# 参考リンク
- 当方ブログ記事を参照 ： [SampleDataSet>>](https://qword.me/python/sample-data "SampleDataSet")
- ジェネレーター ： 
  - [generatedata.com>>](https://generatedata.com/ "generatedata.com")
  - [mockaroo.com>>](https://www.mockaroo.com/ "mockaroo.com")
- Rdatasets一式 ： [vincentarelbundockさん](https://github.com/vincentarelbundock "https://github.com/vincentarelbundock")が纏めてくれているもの、感謝してつかうべし
  - [Available datasets>>](https://vincentarelbundock.github.io/Rdatasets/articles/data.html "https://vincentarelbundock.github.io/Rdatasets/articles/data.html")


# データセット内容
本レポジトリに格納してあるもの。
- esoph.csv : 食道がんのデータセット。ID単位の粒度ではなく集計値のデータ。
- breast.csv : 乳がんのデータセット
- caith.csv：スコットランドのケイスネスの人々の目と髪の色による相互分類に関するデータ。表側が目の色/表頭が髪の色の集計値、元データはRのMASSパッケージ、コレスポンデンス分析等に。

# 補足
本リポジトリに格納しているものは以下の基準で出力し保存している。
- pythonの描画ライブラリであるseabornや統計ライブラリのstatsmodelsから出力したものを一部加工して出力（感謝）
- ファイル末尾のsuffixの意味は以下。
  - _std >> 標準化済み(展開の都合上カテゴリカル変数もone-hot表現の上、標準化)
  - _minmax >> 正規化済み
- データ構造は配列ではなくテーブル形式 / 文字コードはutf-8 / BOM無しデータです。

尚、URLダイレクトな読み込みは git の負荷軽減の為、ダウンロードして使うことを推奨しています。
とにかく前処理無しにすぐ使いたいという方は是非ご利用ください。特徴量をチューニングしている訳ではないので動作検証等に使うことを目的にしています。





