-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_number_of_sessions_by_device_category'),
    grain='month',
    dimensions=['device_category'],
    secondary_calculations=[]
) }}
