-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_unique_visitors'),
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}

