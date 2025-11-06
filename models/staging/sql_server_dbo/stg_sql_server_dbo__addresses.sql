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
    zipcode,
    nullif(trim(address), '') as address_line,
    nullif(trim(state),   '') as state,
    _fivetran_deleted,
    _fivetran_synced

  
FROM src_addresses


) SELECT * FROM addresses_tr