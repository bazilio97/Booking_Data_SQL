USE new_schema;

-- grouping customers by their nationality and calculating their amount

SELECT 
	country,
    COUNT(*) as CountryCount
FROM hotel_booking
GROUP BY country
ORDER BY CountryCount DESC
;

-- grouping by hotel type and its cancelation activity (rate) based on hotel type

SELECT
	hotel as hotel_type,
    SUM(is_canceled = 0 ) as canceled_count,
    SUM(is_canceled = 1 ) as not_canceled_count,
    COUNT(*) as booking_total,
    
    CASE
		WHEN COUNT(*) = 0 THEN 0
        ELSE ROUND( ( SUM( is_canceled = 1 ) / COUNT(*) ) * 100, 2 )
	END as cancel_rate
    
FROM hotel_booking
GROUP BY hotel
;

-- seasonal cancelation rate

SELECT
-- booking by season
-- breaking all bookings by seasons : hot, shoulder and low
    COUNT(CASE
			WHEN arrival_date_month IN ('June', 'July', 'August', 'December', 'January', 'February') 
				AND NOT ( arrival_date_month = 'December' AND arrival_date_day_of_month < 15 ) THEN 1 
		  END) as total_hot_season,
          
	COUNT(CASE
			WHEN arrival_date_month IN ('March', 'April', 'May', 'September', 'October') THEN 1 
		  END) as total_shoulder_season,
	
    COUNT(CASE
			WHEN arrival_date_month = 'November' OR (arrival_date_month = 'December' AND arrival_date_day_of_month < 15) THEN 1
          END) as total_low_season,
          
-- cancelation rate per season
          
	COUNT(CASE
			WHEN is_canceled = 1 AND (arrival_date_month IN ('June', 'July', 'August', 'December', 'January', 'February') 
				AND NOT ( arrival_date_month = 'December' AND arrival_date_day_of_month < 15 )) THEN 1
		  END) /  COUNT(CASE
			WHEN arrival_date_month IN ('June', 'July', 'August', 'December', 'January', 'February') 
				AND NOT ( arrival_date_month = 'December' AND arrival_date_day_of_month < 15 ) THEN 1 
		  END) * 100 as hot_cancel_rate,
	
	COUNT(CASE
			WHEN is_canceled = 1 AND (arrival_date_month IN ('March', 'April', 'May', 'September', 'October')) THEN 1
		  END) / COUNT(CASE
			WHEN arrival_date_month IN ('March', 'April', 'May', 'September', 'October') THEN 1 
		  END) * 100 as shoulder_cancel_rate,
          
	COUNT(CASE
			WHEN is_canceled = 1 AND (arrival_date_month = 'November' OR (arrival_date_month = 'December' AND arrival_date_day_of_month < 15)) THEN 1
		  END) / COUNT(CASE
			WHEN arrival_date_month = 'November' OR (arrival_date_month = 'December' AND arrival_date_day_of_month < 15) THEN 1
          END) * 100 as low_cancel_rate

FROM hotel_booking
;

-- percentage of repeated guests vs new guests

SELECT

	COUNT(CASE WHEN count = 1 THEN 1 END) as new_guests_count,
    COUNT(CASE WHEN count > 1 THEN 1 END) as repeated_guests_count,
    COUNT(*) as total_guests,
    COUNT(CASE WHEN count = 1 THEN 1 END) / COUNT(*) * 100 as new_guest_rate,
    COUNT(CASE WHEN count > 1 THEN 1 END) / COUNT(*) * 100 as repeated_guest_rate
    
FROM (SELECT name, COUNT(*) as count
	  FROM hotel_booking
      WHERE name IS NOT Null
	  GROUP BY name) as guest_count;
      




   