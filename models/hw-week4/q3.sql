select count(*)
from {{ ref("stg_fhv_tripdata") }}
where extract(year from cast(pickup_datetime as timestamp)) = 2019
