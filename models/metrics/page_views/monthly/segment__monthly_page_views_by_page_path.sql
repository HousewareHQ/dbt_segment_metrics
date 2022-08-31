-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__monthly_page_views_by_page_path',
    grain='month',
    dimensions=['context_page_path'],
    secondary_calculations=[]
) }}
