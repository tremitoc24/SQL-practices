/*
	Create a fucntion that returns a table with next information:
	| Mechanic ID | Order ID | Order date | Total cost |
*/

create function f2()
return table	-- Returning table with data from result next select section
as
	return (
		select O.mechanic_id_FK as 'Mechanic ID', O.order_id as 'Order ID',
			O.date as 'Order date', sum(Op.price) as 'Total cost'
		from Orders O, OrderParts Op
			where O.order_id = Op.order_id_FK
			group by O.mechanic_id_FK, O.order_id, O.date)