--------------------------------------------------------------------------------------------
-- PrestoUDF : https://prestodb.io/docs/current/functions/binary.html
--------------------------------------------------------------------------------------------

SELECT
  to_hex(sha256(to_utf8(td_ssc_id))) as sha256_1
 ,to_hex(sha256(to_utf8(concat(td_ssc_id,'mystr')))) as sha256_2 
 ,to_hex(sha512(to_utf8(td_ssc_id))) as sha512_1
 ,to_hex(sha512(to_utf8(concat(td_ssc_id,'mystr')))) as sha512_2
FROM your_database.your_schema.your_table
