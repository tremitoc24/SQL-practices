/*
	Create a procedure that returns the next information:
	'Repair date: {ORDER_DATE}, Repair types: {REPAIR_TYPE}, Total price of repair: {TOTAL_PRICE}'
*/

create procedure p4 (@name nvarchar(92))
as
begin
declare @date datetime,		-- Initialization area for variables for storing temporary data
		@repair_type nvarchar(max) = '',
		@total_price decimal(10,2),
		@order_id int,
		@TEMP_repair_type nvarchar(max),
		@count int;
select @order_id = O.order_id, @date = O.date
from Orders O, Cars C, CarOwners Co
	where CONCAT_WS(' ', Co.first_name, Co.last_name) LIKE @car_owner_name
	and Co.car_id_FK = C.car_id;
	and O.car_id_FK = C.car_id;
select @total_price = SUM(O.price), @count = COUNT(Op.order_id_FK)
from OrderParts Op
	where Op.order_id_FK = @order_id;
while (@count > 0)	--Initialization a loop to find one or more types of repairs
begin
	select @TEMP_repair_type = Rp.name_of_repair
	from RepairTypes Rp, OrderParts Op
		where Op.order_id_FK = @order_id
		and Rp.repair_type_id = Op.repair_type_id_FK;
	set @repair_type = @repair_type + @TEMP_repair_type + ', ';
	set @count = @count - 1;
end
print 'Repair date: ' + Convert(nvarchar(max), @date)		--Information output
	+ ' , Repair types: ' + @repair_type
	+ 'Total price of repair: ' + Convert(nvarchar(max), @total_price);
end;