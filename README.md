# Football Ticket Booking System – Database Design & SQL Queries


## Database Schema

The database contains **3 tables**.

### 1. Users

Stores all registered users including football fans and administrators.

| Column | Description |
|----------|-------------|
| user_id | Unique user ID (Primary Key) |
| full_name | Full name of the user |
| email | Email address |
| role | Ticket Manager or Football Fan |
| phone_number | Contact number |

---

### 2. Matches

Stores football tournament matches.

| Column | Description |
|----------|-------------|
| match_id | Unique match ID (Primary Key) |
| fixture | Competing teams |
| tournament_category | League or Cup name |
| base_ticket_price | Standard ticket price |
| match_status | Available / Selling Fast / Sold Out / Postponed |

---

### 3. Bookings

Stores every ticket purchase.

| Column | Description |
|----------|-------------|
| booking_id | Unique booking ID (Primary Key) |
| user_id | References Users table |
| match_id | References Matches table |
| seat_number | Reserved stadium seat |
| payment_status | Pending / Confirmed / Cancelled / Refunded |
| total_cost | Final booking amount |

---

##  Relationships
- One to Many: One User → Many Bookings (A single football fan can buy tickets for multiple matches throughout the season)
- Many to One: Many Bookings → One Match (A major derby match can be associated with thousands of individual booking records from different fans).

---

## Technologies Used

- PostgreSQL
- BeeKeeper Studio
- Drow.io

---

# Project Structure

```
Football-Ticket-Booking-System/
│
├── README.md
├── queries.sql
└── ERD.png
```

---





