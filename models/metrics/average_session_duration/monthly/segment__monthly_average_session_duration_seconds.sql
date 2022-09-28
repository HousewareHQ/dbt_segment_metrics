-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_average_session_duration_seconds'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
