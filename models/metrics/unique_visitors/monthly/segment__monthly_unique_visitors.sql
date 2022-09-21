-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_unique_visitors'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}

