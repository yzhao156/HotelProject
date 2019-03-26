set search_path='ehotel';
create table hotel_chain(
	chain_name varchar(50) not null,
	office_address varchar(50) not null,
	email varchar(50) not null,
	phone varchar(50) not null,
	categorized varchar(50) not null,
	primary key (name)
);

create table hotel(
	hotel_id varchar(50) not null,
	hotel_name varchar(50) not null,
	hotel_email varchar(50) not null,
	hotel_phone varchar(50) not null,
	hotel_chian_name varchar(50) not null,
	area varchar(50) not null,

	primary key (hotel_id),
	foreign key (hotel_chian_name) references hotel_chain(chain_name)
		on delete cascade 
		on update cascade
);

create table room(
	hotel_id varchar(50) not null,
	room_id varchar(50) not null,
	price varchar(50) not null,
	capacity varchar(50) not null,
	extended boolean not null,
	amenities varchar(50) not null,
	room_view varchar(50) not null,
	problems varchar(50) not null,

	primary key (room_id),
	foreign key (hotel_id) references hotel(hotel_id)
		on delete cascade 
		on update cascade

);

create table employee(
	employee_SSN varchar(50) not null,
	name varchar(50) not null,
	address varchar(50) not null,
	full_time boolean not null,
	role varchar(50) not null,
	hotel_id varchar(50) not null,
	primary key (employee_SSN),
	foreign key (hotel_id) references hotel(hotel_id)
		on delete cascade 
		on update cascade
);

create table customer(
	customer_SSN varchar(50) not null,
	name varchar(50) not null,
	address varchar(50) not null,
	register_time varchar(50) not null,
	primary key (customer_SSN)
);

create table booking(
	booking_id varchar(50) not null,
	room_id varchar(50) not null,
	hotel_chian_name varchar(50) not null,
	hotel_id varchar(50) not null,
	customer_SSN varchar(50) not null,
	booking_time time not null,
	already_pay boolean not null,
	primary key (booking_id),
	foreign key (hotel_id) references hotel(hotel_id),
	foreign key (room_id) references room(room_id),
	foreign key (hotel_chian_name) references hotel_chain(chain_name),
	foreign key (customer_SSN) references customer(customer_SSN)
);