-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__daily_page_views',
    grain='day',
    dimensions=['context_page_path'],
    secondary_calculations=[]
) }}