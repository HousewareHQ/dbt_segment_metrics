-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_unique_visitors_by_country'),
    grain='day',
    dimensions=['context_location_country'],
    secondary_calculations=[]
) }}

