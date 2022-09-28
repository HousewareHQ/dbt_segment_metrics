-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_average_session_duration_seconds_by_referrer_source'),
    grain='month',
    dimensions=['referrer_source'],
    secondary_calculations=[]
) }}
