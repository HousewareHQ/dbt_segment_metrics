-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_page_views'),
    grain='day',
    dimensions=[],
    secondary_calculations=[]
) }}
