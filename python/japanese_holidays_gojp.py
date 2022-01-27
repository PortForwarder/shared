import csv
import numpy as np
import pandas as pd

# 解説： 内閣府ホーム  >  内閣府の政策  >  制度  >  国民の祝日について
# https://www8.cao.go.jp/chosei/shukujitsu/gaiyou.html  ※2022/1月時点

df = pd.read_csv('https://www8.cao.go.jp/chosei/shukujitsu/syukujitsu.csv', encoding='shift_jis')
redf = df.rename(columns={\
                  '国民の祝日・休日月日': 'time_holiday',\
                  '国民の祝日・休日名称': 'time_holiday_name'})
redf.to_csv('japanese_holidays_gojp.csv', encoding = 'utf-8', index = False)
