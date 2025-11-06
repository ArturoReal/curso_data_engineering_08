/* 
COUNTRY STG SELECT
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
     md5(country) as zipcode_id,
     country as country_name,

FROM src_addresses


) SELECT * FROM addresses_tr