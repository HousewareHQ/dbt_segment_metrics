-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_number_of_sessions'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
