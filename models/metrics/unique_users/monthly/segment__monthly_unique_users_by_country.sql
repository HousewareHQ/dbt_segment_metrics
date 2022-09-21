-- depends_on: {{ ref('segment__users') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_unique_users_by_country'),
    grain='month',
    dimensions=['context_location_country'],
    secondary_calculations=[]
) }}

