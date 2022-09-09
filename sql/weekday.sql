SELECT CASE
  when dow(cast(time as timestamp)) = 0 then '日'
  when dow(cast(time as timestamp)) = 1 then '月'
  when dow(cast(time as timestamp)) = 2 then '火'
  when dow(cast(time as timestamp)) = 3 then '水'
  when dow(cast(time as timestamp)) = 4 then '木'
  when dow(cast(time as timestamp)) = 5 then '金'
  when dow(cast(time as timestamp)) = 6 then '土'
