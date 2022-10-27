-- depends_on: {{ ref('segment__pages') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_unique_visitors_by_country'),
    grain='month',
    dimensions=['context_location_country','context_location_city'],
    secondary_calculations=[]
) }}

