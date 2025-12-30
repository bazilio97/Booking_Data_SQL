Hotel Booking Analysis
=====================

This project analyzes hotel booking data using SQL queries to gain insights on customer demographics, booking patterns, cancellation rates, and guest behavior.

Database
--------
- Database: new_schema
- Table: hotel_booking

Queries Overview
----------------

1. Customers Grouped by Nationality
-----------------------------------
This query groups customers by their country and counts the number of bookings per country.
Purpose: Identify which countries contribute most to hotel bookings.

2. Hotel Type and Cancellation Activity
---------------------------------------
Groups bookings by hotel type and calculates cancellation metrics.
Metrics:
- canceled_count – Number of bookings that were not canceled
- not_canceled_count – Number of bookings that were canceled
- booking_total – Total bookings per hotel type
- cancel_rate – Percentage of canceled bookings

3. Seasonal Cancellation Rates
------------------------------
Analyzes booking counts and cancellation rates by season:
- Hot season: June, July, August, December (after 15th), January, February
- Shoulder season: March, April, May, September, October
- Low season: November, December (before 15th)
Purpose: Identify seasonal trends in bookings and cancellations.

4. New vs Repeated Guests
-------------------------
Determines the proportion of new guests versus repeated guests.
Metrics:
- new_guests_count – Guests with only one booking
- repeated_guests_count – Guests with multiple bookings
- new_guest_rate – Percentage of new guests
- repeated_guest_rate – Percentage of repeated guests


Purpose
-------
The analysis provides actionable insights for:
- Marketing strategies targeting key countries
- Understanding hotel cancellation trends by hotel type and season
- Improving customer retention by monitoring repeated guest rates
