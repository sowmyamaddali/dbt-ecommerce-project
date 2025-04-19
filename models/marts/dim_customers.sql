with orders as (

    select *
    from {{ ref('stg_orders') }}

),

customer_summary as (

    select
        CustomerID,
        count(distinct InvoiceNo) as total_purchases,
        sum(Quantity) as total_items_bought,
        sum(Quantity * UnitPrice) as total_revenue
    from orders
    group by CustomerID

)

select *
from customer_summary
order by total_revenue desc
