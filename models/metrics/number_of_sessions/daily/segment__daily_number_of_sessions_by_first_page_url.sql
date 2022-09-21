-- depends_on: {{ ref('segment_web_sessions') }}




{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('segment__daily_number_of_sessions_by_first_page_url'),
    grain='day',
    dimensions=['first_page_url_path'],
    secondary_calculations=[]
) }}
