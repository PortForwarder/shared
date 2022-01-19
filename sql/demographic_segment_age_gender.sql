--------------------------------------------------------------------------------------------
-- Demographic Segment
--------------------------------------------------------------------------------------------


--case

--StandardMarketingFrame
when age <= 19 then '01:19歳以下'
when age <= 29 then '02:20代'
when age <= 39 then '03:30代'
when age <= 49 then '04:40代'
when age <= 59 then '05:50代'
when age <= 69 then '06:60代'
when age >= 70 then '07:70歳以上'


--GoogleAds：https://support.google.com/google-ads/answer/2580383?hl=ja
when age <= 17 then '01:17歳以下'
when age <= 24 then '02:18-24歳'
when age <= 34 then '03:25-34歳'
when age <= 44 then '04:35-44歳'
when age <= 54 then '05:45-54歳'
when age <= 64 then '06:55-64歳'
when age >= 65 then '07:65歳以上'


--GoogleAds(age+gender)
when (age <= 17) and (gender = 'male') then '01:男性17歳以下'
when (age <= 24) and (gender = 'male') then '02:男性18-24歳'
when (age <= 34) and (gender = 'male') then '03:男性25-34歳'
when (age <= 44) and (gender = 'male') then '04:男性35-44歳'
when (age <= 54) and (gender = 'male') then '05:男性45-54歳'
when (age <= 64) and (gender = 'male') then '06:男性55-64歳'
when (age >= 65) and (gender = 'male') then '07:男性65歳以上'
when (age <= 17) and (gender = 'female') then '08:女性17歳以下'
when (age <= 24) and (gender = 'female') then '09:女性18-24歳'
when (age <= 34) and (gender = 'female') then '10:女性25-34歳'
when (age <= 44) and (gender = 'female') then '11:女性35-44歳'
when (age <= 54) and (gender = 'female') then '12:女性45-54歳'
when (age <= 64) and (gender = 'female') then '13:女性55-64歳'
when (age >= 65) and (gender = 'female') then '14:女性65歳以上'


--StandardMarketingFrame(age+gender)
when (age <= 19) and (gender = 'male') then '01:男性19歳以下'
when (age <= 29) and (gender = 'male') then '02:男性20代'
when (age <= 39) and (gender = 'male') then '03:男性30代'
when (age <= 49) and (gender = 'male') then '04:男性40代'
when (age <= 59) and (gender = 'male') then '05:男性50代'
when (age <= 69) and (gender = 'male') then '06:男性60代'
when (age >= 70) and (gender = 'male') then '07:男性70歳以上'
when (age <= 19) and (gender = 'female') then '08:女性19歳以下'
when (age <= 29) and (gender = 'female') then '09:女性20代'
when (age <= 39) and (gender = 'female') then '10:女性30代'
when (age <= 49) and (gender = 'female') then '11:女性40代'
when (age <= 59) and (gender = 'female') then '12:女性50代'
when (age <= 69) and (gender = 'female') then '13:女性60代'
when (age >= 70) and (gender = 'female') then '14:女性70歳以上'


--StandardMarketingFrame(age+gender)
when (age <= 17) and (gender = 'male') then '01:男性17歳以下'
when (age<= 24) and (gender = 'male') then '02:男性18-24歳'
when (age<= 34) and (gender = 'male') then '03:男性25-34歳'
when (age<= 44) and (gender = 'male') then '04:男性35-44歳'
when (age<= 54) and (gender = 'male') then '05:男性45-54歳'
when (age<= 64) and (gender = 'male') then '06:男性55-64歳'
when (age>= 65) and (gender = 'male') then '07:男性65歳以上'
when (age<= 17) and (gender = 'female') then '08:女性17歳以下'
when (age<= 24) and (gender = 'female') then '09:女性18-24歳'
when (age<= 34) and (gender = 'female') then '10:女性25-34歳'
when (age<= 44) and (gender = 'female') then '11:女性35-44歳'
when (age<= 54) and (gender = 'female') then '12:女性45-54歳'
when (age<= 64) and (gender = 'female') then '13:女性55-64歳'
when (age>= 65) and (gender = 'female') then '14:女性65歳以上'


--StandardMarketingFrame(FMCT)
when (age <= 12) and (gender = 'male') then '01:C層(男女12歳以下)'
when (age <= 19) and (gender = 'male') then '02:T層(男女13-19)'
when (age <= 12) and (gender = 'female') then '01:C層(男女12歳以下)'
when (age <= 19) and (gender = 'female') then '02:T層(男女13-19)'
when (age <= 34) and (gender = 'male') then '03:M1層(男性20-34歳)'
when (age <= 49) and (gender = 'male') then '04:M2層(男性35-49歳)'
when (age <= 64) and (gender = 'male') then '05:M3層(男性50-64歳)'
when (age >= 65) and (gender = 'male') then '06:M4層(男性65歳以上)'
when (age <= 34) and (gender = 'female') then '07:F1層(女性20-34歳)'
when (age <= 49) and (gender = 'female') then '08:F2層(女性35-49歳)'
when (age <= 64) and (gender = 'female') then '09:F3層(女性50-64歳)'
when (age >= 65) and (gender = 'female') then '10:F4層(女性65歳以上)'


--else '' end as your_segment_name

