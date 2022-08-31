-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__monthly_page_views',
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
