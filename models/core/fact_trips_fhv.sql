{{ config(materialized="table") }}

with dim_zones as (select * from {{ ref("dim_zones") }} where borough != 'Unknown')

select
    stg_fhv_tripdata.dispatching_base_num,
    stg_fhv_tripdata.pickup_datetime,
    stg_fhv_tripdata.dropoff_datetime,
    stg_fhv_tripdata.pulocationid,
    pickup_zone.borough as pickup_borough,
    pickup_zone.zone as pickup_zone,
    stg_fhv_tripdata.dolocationid,
    dropoff_zone.borough as dropoff_borough,
    dropoff_zone.zone as dropoff_zone,
    stg_fhv_tripdata.sr_flag,
    stg_fhv_tripdata.affiliated_base_number
from {{ ref("stg_fhv_tripdata") }}
inner join
    dim_zones as pickup_zone on stg_fhv_tripdata.pulocationid = pickup_zone.locationid
inner join
    dim_zones as dropoff_zone on stg_fhv_tripdata.dolocationid = dropoff_zone.locationid
