/* 
ADDRESSES_LINE STG SELECT
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

SELECT DISTINCT
     md5(address) as address_line_id,
     address as address_name,
     md5(zipcode) as zipcode_id
FROM src_addresses


) SELECT * FROM addresses_tr