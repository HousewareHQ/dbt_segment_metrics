-- depends_on: {{ ref('segment__users') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_unique_users'),
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}

