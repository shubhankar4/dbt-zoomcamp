{{
    config(
        materialized='view'
    )
}}

SELECT *
FROM {{ source('staging', 'fhv_tripdata') }}