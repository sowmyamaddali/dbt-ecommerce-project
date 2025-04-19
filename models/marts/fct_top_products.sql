with orders as (

    select *
    from {{ ref('stg_orders') }}

),

product_summary as (

    select
        StockCode,
        Description,
        sum(Quantity) as total_sold,
        sum(Quantity * UnitPrice) as total_revenue
    from orders
    group by StockCode, Description

),

ranked as (

    select *,
        row_number() over (order by total_revenue desc) as rank
    from product_summary

)

select *
from ranked
where rank <= 10
