select count(*)
from {{ ref("fact_trips_fhv") }}
where extract(year from pickup_datetime) = 2019