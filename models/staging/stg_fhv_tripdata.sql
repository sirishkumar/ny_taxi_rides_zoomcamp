{{ config(materialized='view') }}

select 
  {{ dbt_utils.surrogate_key(['dispatching_base_num', 'pickup_datetime']) }} as tripid,
  dispatching_base_num,
  cast(pickup_datetime as timestamp) as pickup_datetime,
  cast(dropoff_datetime as timestamp) as dropoff_datetime,
  cast(PULocationID as integer) as pickup_locationid,
  cast(DOLocationID as integer) as dropoff_locationid,
  cast(SR_Flag as bool) as sr_flag
from {{ source('staging', 'fhv_tripdata') }}
where dispatching_base_num is not null
{% if var('is_test_run', default=true) %}
limit 100
{% endif %}
