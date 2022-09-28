-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__monthly_number_of_sessions_by_last_page_url'),
    grain='month',
    dimensions=['last_page_url_path'],
    secondary_calculations=[]
) }}
