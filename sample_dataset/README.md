# はじめに・・・
pythonライブラリのパッケージに含まれるものを使ってデータベースにインポートしてあげる方法が「それっぽいサンプルデータがあって」種類も豊富で手っ取り早い。このデータは英語名表記のカラム名の為、そのまま入力データとしてアルゴリズムに組み込めたり、プロットしても凡例が豆腐(＝文字化け)することがないのがメリットである。日本語カラム名撲滅。

# 参考リンク
- 当方ブログ記事を参照 ： [SampleDataSet>>](https://qword.me/python/sample-data "SampleDataSet")
- ジェネレーター ： 
  - [generatedata.com>>](https://generatedata.com/ "generatedata.com")
  - [mockaroo.com>>](https://www.mockaroo.com/ "mockaroo.com")
- Rdatasets一式 ： [vincentarelbundockさん](https://github.com/vincentarelbundock "https://github.com/vincentarelbundock")が纏めてくれているもの、感謝してつかうべし
  - [https://github.com/vincentarelbundock/Rdatasets>>](https://github.com/vincentarelbundock/Rdatasets "https://github.com/vincentarelbundock/Rdatasets")

# 展開ファイル
本リポジトリに格納しているものは以下の基準で出力し保存している。
- pythonの描画ライブラリであるseabornや統計ライブラリのstatsmodelsから出力したものを一部加工して出力（感謝）
- ファイル末尾のsuffixの意味は以下。
  - _std >> 標準化済み 
  - _minmax >> 正規化済み 

尚、URLダイレクトな読み込みは git の負荷軽減の為、ダウンロードして使うことを推奨。
