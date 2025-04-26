with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select 
        order_id,
        location_id,
        customer_id,
        order_total as order_amount,
        tax_paid,
        ordered_at,
        customer_name,
        location_name,
        tax_rate,
        extract(date from location_opened_at) as location_opened_at,
        extract(month from ordered_at) as ordered_month,
        extract(day from ordered_at) as ordered_day,
        extract(year from ordered_at) as ordered_year
    from orders
)

select * 
from final