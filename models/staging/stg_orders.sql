with raw_orders as (
	select *
	from read_csv_auto('./data/data.csv')
)

select
    InvoiceNo,
    StockCode,
    Description,
    cast(Quantity as integer) as Quantity,
    cast(InvoiceDate as timestamp) as InvoiceDate,
    cast(UnitPrice as double) as UnitPrice,
    cast(CustomerID as integer) as CustomerID,
    Country
from raw_orders
	