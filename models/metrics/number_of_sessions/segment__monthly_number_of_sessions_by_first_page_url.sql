-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__daily_number_of_sessions_by_first_page_url',
    grain='month',
    dimensions=['first_page_url_path'],
    secondary_calculations=[]
) }}
