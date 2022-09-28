-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_average_session_duration_seconds'),
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}
