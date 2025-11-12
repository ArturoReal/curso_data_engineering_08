/* 
USERS STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_users as (
SELECT 
    user_id,
    convert_timezone('UTC',updated_at) as updated_at_utc,
    address_id,
    convert_timezone('UTC', created_at) as created_at_utc,
    _fivetran_deleted,
    CONVERT_TIMEZONE('UTC', _fivetran_synced) AS date_utc

FROM {{source('sql_server_dbo','users')}}
) SELECT * FROM src_users