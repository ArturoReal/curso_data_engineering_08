/* 
EVENTS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_events as (
SELECT 
event_id, 
page_url,
md5(event_type) as event_type_id,
user_id,
product_id,
session_id,
convert_timezone('UTC', created_at) as created_at_utc,
order_id,
_fivetran_deleted,
convert_timezone('UTC', _fivetran_synced) as date_utc
FROM {{source('sql_server_dbo','events')}}
) SELECT * FROM src_events