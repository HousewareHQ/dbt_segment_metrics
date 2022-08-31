-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.metric(
    metric_name='segment__daily_average_session_duration_seconds',
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}
