--------------------------------------------------------------------------------------------
-- ▽Reference
---- https://docs.treasuredata.com/display/public/PD/Supported+Presto+and+TD+Functions
---- https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E5%9C%B0%E5%9F%9F
--------------------------------------------------------------------------------------------



WITH q as (
 SELECT
	case 
		when regexp_like(td_ip_to_least_specific_subdivision_name(web.td_ip),'(.+)')  then td_ip_to_least_specific_subdivision_name(web.td_ip)
			else 'unknown' end as td_specific_subdivision_name
			FROM your_database.your_web_access_table as web
			)

SELECT
  td_specific_subdivision_name
 ,case
    when regexp_like(td_specific_subdivision_name,'Hokkaido')  then '北海道'
    when regexp_like(td_specific_subdivision_name,'Aomori')  then '青森県'
    when regexp_like(td_specific_subdivision_name,'Iwate')  then '岩手県'
    when regexp_like(td_specific_subdivision_name,'Miyagi')  then '宮城県'
    when regexp_like(td_specific_subdivision_name,'Akita')  then '秋田県'
    when regexp_like(td_specific_subdivision_name,'Yamagata')  then '山形県'
    when regexp_like(td_specific_subdivision_name,'Fukushima-ken')  then '福島県'
    when regexp_like(td_specific_subdivision_name,'Niigata')  then '新潟県'
    when regexp_like(td_specific_subdivision_name,'Toyama')  then '富山県'
    when regexp_like(td_specific_subdivision_name,'Ishikawa')  then '石川県'
    when regexp_like(td_specific_subdivision_name,'Fukui')  then '福井県'
    when regexp_like(td_specific_subdivision_name,'Yamanashi')  then '山梨県'
    when regexp_like(td_specific_subdivision_name,'Nagano')  then '長野県'
    when regexp_like(td_specific_subdivision_name,'Ibaraki')  then '茨城県'
    when regexp_like(td_specific_subdivision_name,'Tochigi')  then '栃木県'
    when regexp_like(td_specific_subdivision_name,'Gunma')  then '群馬県'
    when regexp_like(td_specific_subdivision_name,'Saitama')  then '埼玉県'
    when regexp_like(td_specific_subdivision_name,'Chiba')  then '千葉県'
    when regexp_like(td_specific_subdivision_name,'Tokyo')  then '東京都'
    when regexp_like(td_specific_subdivision_name,'Kanagawa')  then '神奈川県'
    when regexp_like(td_specific_subdivision_name,'Gifu')  then '岐阜県'
    when regexp_like(td_specific_subdivision_name,'Shizuoka')  then '静岡県'
    when regexp_like(td_specific_subdivision_name,'Aichi')  then '愛知県'
    when regexp_like(td_specific_subdivision_name,'Mie')  then '三重県'
    when regexp_like(td_specific_subdivision_name,'Shiga')  then '滋賀県'
    when regexp_like(td_specific_subdivision_name,'Kyoto')  then '京都府'
    when regexp_like(td_specific_subdivision_name,'Ōsaka')  then '大阪府'
    when regexp_like(td_specific_subdivision_name,'Hyōgo')  then '兵庫県'
    when regexp_like(td_specific_subdivision_name,'Nara')  then '奈良県'
    when regexp_like(td_specific_subdivision_name,'Wakayama')  then '和歌山県'
    when regexp_like(td_specific_subdivision_name,'Tottori')  then '鳥取県'
    when regexp_like(td_specific_subdivision_name,'Shimane')  then '島根県'
    when regexp_like(td_specific_subdivision_name,'Okayama')  then '岡山県'
    when regexp_like(td_specific_subdivision_name,'Hiroshima')  then '広島県'
    when regexp_like(td_specific_subdivision_name,'Yamaguchi')  then '山口県'
    when regexp_like(td_specific_subdivision_name,'Tokushima')  then '徳島県'
    when regexp_like(td_specific_subdivision_name,'Kagawa')  then '香川県'
    when regexp_like(td_specific_subdivision_name,'Ehime')  then '愛媛県'
    when regexp_like(td_specific_subdivision_name,'Kochi')  then '高知県'
    when regexp_like(td_specific_subdivision_name,'Fukuoka')  then '福岡県'
    when regexp_like(td_specific_subdivision_name,'Saga')  then '佐賀県'
    when regexp_like(td_specific_subdivision_name,'Nagasaki')  then '長崎県'
    when regexp_like(td_specific_subdivision_name,'Kumamoto')  then '熊本県'
    when regexp_like(td_specific_subdivision_name,'Oita')  then '大分県'
    when regexp_like(td_specific_subdivision_name,'Miyazaki')  then '宮崎県'
    when regexp_like(td_specific_subdivision_name,'Kagoshima')  then '鹿児島県'
    when regexp_like(td_specific_subdivision_name,'Okinawa')  then '沖縄県'
      else 'unknown' end as td_specific_subdivision_name_prefectures

 ,case
    when regexp_like(td_specific_subdivision_name,'Hokkaido')  then '北海道地方'
    when regexp_like(td_specific_subdivision_name,'Aomori')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Iwate')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Miyagi')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Akita')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Yamagata')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Fukushima-ken')  then '東北地方'
    when regexp_like(td_specific_subdivision_name,'Niigata')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Toyama')  then '中部地方'   
    when regexp_like(td_specific_subdivision_name,'Ishikawa')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Fukui')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Yamanashi')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Nagano')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Gifu')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Shizuoka')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Aichi')  then '中部地方'
    when regexp_like(td_specific_subdivision_name,'Ibaraki')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Tochigi')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Gunma')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Saitama')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Chiba')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Tokyo')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Kanagawa')  then '関東地方'
    when regexp_like(td_specific_subdivision_name,'Mie')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Shiga')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Kyoto')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Ōsaka')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Hyōgo')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Nara')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Wakayama')  then '関西地方'
    when regexp_like(td_specific_subdivision_name,'Tottori')  then '中国地方'
    when regexp_like(td_specific_subdivision_name,'Shimane')  then '中国地方'
    when regexp_like(td_specific_subdivision_name,'Okayama')  then '中国地方'
    when regexp_like(td_specific_subdivision_name,'Hiroshima')  then '中国地方'
    when regexp_like(td_specific_subdivision_name,'Yamaguchi')  then '中国地方'
    when regexp_like(td_specific_subdivision_name,'Tokushima')  then '四国地方'
    when regexp_like(td_specific_subdivision_name,'Kagawa')  then '四国地方'
    when regexp_like(td_specific_subdivision_name,'Ehime')  then '四国地方'
    when regexp_like(td_specific_subdivision_name,'Kochi')  then '四国地方'
    when regexp_like(td_specific_subdivision_name,'Fukuoka')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Saga')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Nagasaki')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Kumamoto')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Oita')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Miyazaki')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Kagoshima')  then '九州・沖縄地方'
    when regexp_like(td_specific_subdivision_name,'Okinawa')  then '九州・沖縄地方'
      else 'unknown' end as td_specific_subdivision_name_8regions
FROM q

