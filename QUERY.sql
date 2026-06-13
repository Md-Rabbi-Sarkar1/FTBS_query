create database FTBS;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;
create table Users(
  user_id serial primary key,
  full_name varchar(100) ,
  email varchar(100) unique,
  role varchar(20)check (role in('Ticket Manager','Football Fan')),
  phone_number varchar(20)
);
create table Matches(
  match_id serial primary key,
  fixture varchar(150),
  tournament_category varchar(100),
  base_ticket_price decimal(10,2) check (base_ticket_price >0),
  match_status varchar(20) check(match_status in('Availabe','Selling Fast','Sold Out', 'Postponed'))
);
create table Bookings(
  booking_id serial primary key,
  user_id int references Users(user_id) ,
  match_id int references Matches(match_id),
  seat_number varchar(20),
  payment_status varchar(20) check(payment_status in('Pending','Confirmed','Cancelled')),
  total_cost decimal(10,2) check(total_cost >=0)
);
