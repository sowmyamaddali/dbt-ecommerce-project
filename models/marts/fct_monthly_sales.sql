with orders as (

    select *
    from {{ ref('stg_orders') }}

),

aggregated as (

    select
        date_trunc('month', InvoiceDate) as month,
        sum(Quantity) as total_quantity,
        sum(Quantity * UnitPrice) as total_revenue,
        count(distinct CustomerID) as unique_customers
    from orders
    group by 1

)

select *
from aggregated
order by month
