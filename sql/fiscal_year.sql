--------------------------------------------------------------------------------------------
-- 会計年度を算出するTips  ※yourdateの部分を書き換えてください。
-- dateformat = yyyy-mm-dd 
-- 検証環境：presto
-- 想定決算月＝3月
----> 戻り値のINTが1-3の場合、当年−1年を算出、それ以外は当年を出力 → 会計年度が出力
-- 和暦を変換したい場合はこちら：
----> https://github.com/PortForwarder/shared/blob/main/master_dataset/japanese_year_name.tsv
--------------------------------------------------------------------------------------------


--- 戻り値がINTで良い場合(高速化のために文字列で保持したくない場合)
,IF((CAST(substr(yourdate,6,2) as INTEGER) < 4),(CAST(substr(yourdate,1,4) as INTEGER) - 1),(CAST(substr(yourdate,1,4) as INTEGER)))

--- 戻り値を文字列にして年n月期とする場合
,CAST(IF((CAST(substr(yourdate,6,2) as INTEGER) < 4),(CAST(substr(yourdate,1,4) as INTEGER) - 1),(CAST(substr(yourdate,1,4) as INTEGER))) as VARCHAR) || '年3月期'
