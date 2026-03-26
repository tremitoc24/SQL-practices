/*
	Create a function that returns the mechanic's initials obtained from the function 1 the sum of all his completed works and the deviation from the mean value
*/

create function f3()
returns @t table	-- Using this method allow to use complex queries
	(mechanic_name nvarchar(max),
	total_cost decimal(10,2), 
	price_volatility real null)
as
begin
	declare @avg real;
	insert into @t
		select f1(O.mechanic_id_FK),	-- Obtaining mechanic's initials from the function 1
			sum(Op.price), null
		from Orders O, OrderParts Op
			wher Op.order_id_FK = O.order_id
			group by f1(O.mechanic_id_FK);
	select @avg = avg(price_volatility) from @t
		update @t set price_volatility = total_price - @avg;
	return;
end