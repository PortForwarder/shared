SELECT CASE
  when dow(cast(time as timestamp)) = 1 then '月'
  when dow(cast(time as timestamp)) = 1 then '火'
  when dow(cast(time as timestamp)) = 1 then '水'
  when dow(cast(time as timestamp)) = 1 then '木'
  when dow(cast(time as timestamp)) = 1 then '金'
  when dow(cast(time as timestamp)) = 1 then '土'
  when dow(cast(time as timestamp)) = 1 then '日'
  else '' end as weekday
