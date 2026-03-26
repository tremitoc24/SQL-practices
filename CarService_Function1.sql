/*
	Create a function that takes mechanic id as an argument and returns its initials (first name + last name)
*/

create function f1(@mechanic_id INT)
returns nvarchar(max)	-- Returning result of next select section
as
begin
	return (
		select first_name + ' ' + concat_ws('. ', substring(last_name, 1, 1))	-- Making initials like format 'First. L'
		FROM Mechanics
			WHERE @mechanic_id = mechanic_id);
end