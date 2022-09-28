-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_page_views'),
    grain='month',
    dimensions=[],
    secondary_calculations=[]
) }}
