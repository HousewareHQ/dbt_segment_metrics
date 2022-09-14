-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__monthly_unique_visitors_by_country',
    grain='month',
    dimensions=['context_location_country'],
    secondary_calculations=[]
) }}

