-- depends_on: {{ ref('segment__tracks') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_event_count_by_event_type'),
    grain='day',
    dimensions=['event'],
    secondary_calculations=[]
) }}
