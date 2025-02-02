-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_page_views_by_page_referrer'),
    grain='day',
    dimensions=['context_page_referrer'],
    secondary_calculations=[]
) }}
