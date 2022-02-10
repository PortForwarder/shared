--------------------------------------------------------------------------------------------
-- PrestoUDF : https://prestodb.io/docs/current/functions/binary.html
-- TD Functions： https://docs.treasuredata.com/display/public/PD/Supported+Presto+and+TD+Functions
--------------------------------------------------------------------------------------------

SELECT
--Td UDF
  td_ssc_id
 ,smart_digest(td_ssc_id) as digest1
 ,smart_digest(td_ssc_id, 4.5)  as digest2
 ,td_md5(td_ssc_id) as md5
 ,td_md5(concat('incu',td_ssc_id)) as md5_2
 ,substr(td_md5(td_ssc_id),4,5) || td_md5(td_ssc_id) as md5_3
 ,substr(td_md5(td_ssc_id),4,5) || td_md5(td_ssc_id) as md5_3

--PrestoUDF : https://prestodb.io/docs/current/functions/binary.html
 ,to_hex(sha256(to_utf8(td_ssc_id))) as sha256_1
 ,to_hex(sha256(to_utf8(concat(td_ssc_id,'mystr')))) as sha256_2 
 ,to_hex(sha512(to_utf8(td_ssc_id))) as sha512_1
 ,to_hex(sha512(to_utf8(concat(td_ssc_id,'mystr')))) as sha512_2
FROM your_database.your_schema.your_table
