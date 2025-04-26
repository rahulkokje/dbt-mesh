with source as (
    select * from {{ source('jaffle_shop', 'raw_stores') }}
),

renamed as (
    select
        id as location_id,
        name as location_name,
        tax_rate,
        opened_at as location_opened_at
    from source
)

select * from renamed