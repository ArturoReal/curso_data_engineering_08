/* 
EVENTS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_events as (
SELECT *
FROM {{source('sql_server_dbo','events')}}
) SELECT * FROM src_events