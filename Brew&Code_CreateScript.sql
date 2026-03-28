create table Customers
(
	customer_id	int not null primary key,
	phone	varchar(20) not null,
	name	varchar(50) not null,
	bonus_balance	money
);

create table PaymentsTypes
(
	pay_type_id	int not null primary key,
	name varchar(20) not null
);

create table OrderStatuses
(
	status_id	int not null primary key,
	status	varchar(20) not null
);

create table MenuCategories
(
	category_id	int not null primary key,
	name varchar(40) not null
);

create table Units
(
	unit_id	int not null primary key,
	name	varchar(10) not null
);

create table Ingredients
(
	ingredient_id	int not null primary key,
	unit_id	int not null,
	name	varchar(20) not null,
	current_stock	decimal(10,2) not null,
	foreign key (unit_id) references Units(unit_id)
);

create table MenuItems
(
	menu_item_id	int not null primary key,
	category_id	int not null,
	name	varchar(40) not null,
	price	money not null,
	foreign key (category_id) references MenuCategories(category_id)
);

create table Orders
(
	order_id	int not null primary key,
	customer_id	int not null,
	payment_type_id	int,
	status_id	int,
	order_datetime	timestamp not null,
	bonus_used	money,
	foreign key (customer_id) references Customers(customers_id),
	foreign key (payment_type_id) references PaymentsTypes(pay_type_id),
	foreign key (status_id) references OrderStatuses(status_id)
);

create table Recipes
(
	recipe_id	int not null primary key,
	menu_item_id	int not null,
	ingredients_id	int not null,
	quantity_requared	decimal(10,2) not null,
	foreign key (menu_item_id) references MenuItems(menu_item_id),
	foreign key (ingredients_id) references Ingredients(ingredient_id)
);

create table OrderParts
(
	order_part_id	int not null primary key,
	order_id	int not null,
	menu_item_id	int not null,
	quantity	smallint not null,
	price_at_moment	money,
	foreign key (order_id) references Orders(order_id),
	foreign key (menu_item_id) references MenuItems(menu_item_id)
)