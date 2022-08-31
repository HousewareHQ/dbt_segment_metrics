-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__monthly_number_of_sessions_by_page_path',
    grain='month',
    dimensions=['last_page_url_path'],
    secondary_calculations=[]
) }}
