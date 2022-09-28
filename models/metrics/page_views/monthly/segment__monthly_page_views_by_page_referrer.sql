-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_page_views_by_page_referrer'),
    grain='month',
    dimensions=['context_page_referrer'],
    secondary_calculations=[]
) }}
