DROP TABLE IF EXISTS Bookings;

DROP TABLE IF EXISTS Matches;

DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id int primary key,
  full_name varchar(100) not null,
  email varchar(100) unique not null,
  role varchar(50) not null check (role in ('Ticket Manager', 'Football Fan')),
  phone_number varchar(15)
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id int primary key,
  fixture varchar(150) not null,
  tournament_category varchar(100) not null,
  base_ticket_price decimal(10, 2) not null check (base_ticket_price >= 0),
  match_status varchar(50) not null check (
    match_status in (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id int primary key,
  user_id int not null,
  match_id int not null,
  seat_number varchar(20),
  payment_status varchar(20) check (
    payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost decimal(10, 2) not null check (total_cost >= 0),
  -- Foreign Key constraint linking 'user_id' to the Users table
  foreign key (user_id) references users (user_id),
  -- Foreign Key constraint linking 'match_id' to the Matches table
  foreign key (match_id) references matches (match_id)
);