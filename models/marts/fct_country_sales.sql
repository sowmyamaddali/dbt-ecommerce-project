with orders as (

    select *
    from {{ ref('stg_orders') }}

),

country_summary as (

    select
        Country,
        sum(Quantity) as total_items_sold,
        sum(Quantity * UnitPrice) as total_revenue,
        count(distinct CustomerID) as unique_customers
    from orders
    group by Country

)

select *
from country_summary
order by total_revenue desc
