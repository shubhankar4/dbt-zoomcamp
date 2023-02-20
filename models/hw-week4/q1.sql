select count(*)
from {{ ref("fact_trips") }}
where extract(year from pickup_datetime) in (2019, 2020)
