/* 
shipping_service STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_shipping as (
SELECT *
FROM {{source('sql_server_dbo','orders')}}
), 

shipping_tr as (

SELECT 
    case when shipping_service = '' then md5('unknown')
    else md5(shipping_service) end as shipping_service_id,
    case when shipping_service = '' then 'unknown'
    else shipping_service end as shipping_service_name

FROM src_shipping

) SELECT * FROM shipping_tr