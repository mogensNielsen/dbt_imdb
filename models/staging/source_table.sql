with
source_table as (
    select *
    from {{ source('source_db', 'source_table') }}
)

select *
from source_table
