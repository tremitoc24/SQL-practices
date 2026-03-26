/*
	Create a query that return information like next table:
	| Sign | Mark | Color | Car year | Owner name |
*/

select C.car_id as sign, Ì.name_of_mark as mark,
C.name_of_color as color, C.car_year,
CONCAT_WS(' ', Co.first_name, Co.last_name) as owner_name
from Cars as C inner join	-- Using INNER JOIN allows you to sequentially connect tables to search for information in queries 
                         Marks as M on C.mark_id_FK = M.mark_id inner join
                         Colors as C on C.color_id_FK = C.color_id inner join
                         CarOwners as Co on C.car_id = Co.car_id_FK