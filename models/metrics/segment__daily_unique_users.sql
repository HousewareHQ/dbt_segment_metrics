-- depends_on: {{ ref('segment__identifies') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__daily_unique_users',
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}
