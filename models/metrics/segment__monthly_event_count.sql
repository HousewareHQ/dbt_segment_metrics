-- depends_on: {{ ref('segment__tracks') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__monthly_event_count',
    grain='month',
    dimensions=['event'],
    secondary_calculations=[]
) }}

