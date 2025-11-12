/* 
ADDRESSES STG SELECT
*/
{{
  config(
    materialized='view'
  )
}}

WITH src_addresses as (
SELECT *
FROM {{source('sql_server_dbo','addresses')}}
), 

addresses_tr as (

SELECT 
    trim(address_id) as address_id,
    md5(address) as address_line_id,
    _fivetran_deleted,
    convert_timezone('UTC',_fivetran_synced) as date_utc
FROM src_addresses


) SELECT * FROM addresses_tr