--------------------------------------------------------------------------------------------
-- ▽Sample
---- 1640995200 >> UTC 2021/01/01 00:00:00
---- 1640962800 >> Asia/Tokyo(JST) 2021/01/01 00:00:00 / UTC+9:00

-- ▽Docs
---- https://prestodb.io/docs/current/functions/datetime.html
---- https://docs.treasuredata.com/display/public/PD/Supported+Presto+and+TD+Functions
--------------------------------------------------------------------------------------------

SELECT
  current_timezone() as current_timezone
 ,now() as nowtime
 ,td_scheduled_time()
 
--▽Unixtime >> Date
 ,td_time_format(1640962800, 'yyyy-MM-dd HH:mm:ss', 'JST') as td_udf_date
 ,date_format(from_unixtime(1640962800, 'Asia/Tokyo'), '%Y-%m-%d %H:%i:%s') as presto_date


--▽Unixtime >> String Date (td udf)
,td_time_string(1641008135, 'y!', 'jst') as td_udf_str_timestamp_y  -- >> 2022
,td_time_string(1641008135, 'M!', 'jst') as td_udf_str_timestamp_month  -- >> 2022-01
,td_time_string(1641008135, 'd!', 'jst') as td_udf_str_timestamp_day  -- >> 2022-01-01
,td_time_string(1641008135, 'h!', 'jst') as td_udf_str_timestamp_hour  -- >> 2022-01-01 12
,td_time_string(1641008135, 'm!', 'jst') as td_udf_str_timestamp_minutes  -- >> 2022-01-01 12:35
,td_time_string(1641008135, 's!', 'jst') as td_udf_str_timestamp_second  -- >> 2022-01-01 12:35:35


--▽TimeZone(A>>B)
 ,timestamp '2022-1-01 00:00 UTC' at time zone 'Asia/Tokyo' as presto_timezone_trans


--▽Date >> Unixtime
 ,td_time_parse('2022-01-01 00:00', 'JST') as td_udf_unix_timezone
 ,to_unixtime(cast('2022-01-01 00:00' as timestamp)) as presto_unix_timezone
 ,to_unixtime(cast('2022-01-01 00:00' as timestamp))-(9*60*60) as presto_unix_timezone_jst


--▽Round
 --trunc
 ,td_date_trunc('day',1640962800,'JST') as td_udf_round_day
 ,td_date_trunc('week',1640962800,'JST') as td_udf_round_week
 ,td_date_trunc('month',1640962800,'JST') as td_udf_round_month
 ,td_date_trunc('year',1640962800,'JST')  as td_udf_round_year
 --format
 ,td_time_format(1640962800, 'HH', 'JST')  as td_udf_format_hh
 ,td_time_format(1640962800, 'dd', 'JST')  as td_udf_format_dd
 ,td_time_format(1640962800, 'MM', 'JST')  as td_udf_format_mm
 ,td_time_format(1640962800, 'yyyy', 'JST')  as td_udf_format_yyyy


--▽FirebaseEventTimestamp
,event_timestamp
,substr(cast(event_timestamp as VARCHAR), 1, 10) as fbase_time_trans1
,td_time_format((event_timestamp/1000000), 'yyyy-MM-dd HH:mm:ss', 'JST') as fbase_time_trans2
,td_time_format((event_timestamp/1000000), 'yyyy-MM-dd', 'JST') as fbase_time_trans3
,td_time_format(cast(substr(cast(event_timestamp as VARCHAR), 1, 10) as INTEGER), 'yyyy-MM-dd HH:mm:ss', 'JST') as  as fbase_time_trans4
,td_time_format(cast(substr(cast(event_timestamp as VARCHAR), 1, 10) as INTEGER), 'yyyy-MM-dd', 'JST') as  as fbase_time_trans5


FROM your_database.your_table

WHERE 1=1
--▽TD:Unixtime >> Date & Between
  AND td_time_range(unixtime,NULL,'yyyy-MM-dd','JST')
  --AND td_time_range(unixtime,'yyyy-MM-dd',NULL,'JST')
  --AND td_time_range(unixtime,'yyyy-MM-dd','yyyy-MM-dd','JST')
--▽Presto:
  --AND yourtimestamp between '2021-01-01 00:00:00' AND '2021-01-10 23:59:59'
  --AND cast(yourtimestamp as timestamp) between
        --cast('2021-01-01 00:00:00' as timestamp) and
        --cast('2021-01-10 00:00:00' as timestamp) 
--   and time >= (to_unixtime(cast((cast(date_format(current_date,'%Y-%m-01') as timestamp) - interval '1' month) as timestamp)))-(9*60*60)
--   and time >= td_time_parse((substr(cast((cast(date_format(current_date,'%Y-%m-01') as timestamp) - interval '1' month)as varchar),1,10)), 'jst')
