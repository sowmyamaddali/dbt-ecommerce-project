with raw_orders as (
	select *
	-- from read_csv_auto('./data/data.csv')
	from read_csv_auto('./data/data.csv', ignore_errors=True)

)

select
    InvoiceNo,
    StockCode,
    Description,
    cast(Quantity as integer) as Quantity,
   -- cast(InvoiceDate as timestamp) as InvoiceDate,
   -- Format: MM/DD/YYYY HH24:MI or M/D/YYYY HH24:MI
	strptime(InvoiceDate, '%m/%d/%Y %H:%M') as InvoiceDate,
    cast(UnitPrice as double) as UnitPrice,
    cast(CustomerID as integer) as CustomerID,
    Country
from raw_orders
	