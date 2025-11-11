/* 
EVENT_TYPE STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_events as (
SELECT DISTINCT 
md5(event_type) as event_type_id,
event_type as event_type_name,
FROM {{source('sql_server_dbo','events')}}
) SELECT * FROM src_events