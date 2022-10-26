-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__daily_unique_visitors_by_country_and_city',
    grain='day',
    dimensions=['context_location_country','context_location_city'],
    secondary_calculations=[]
) }}

