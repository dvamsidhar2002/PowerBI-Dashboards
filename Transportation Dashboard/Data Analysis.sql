
# Top 3 Cities by total trips

WITH CityTripCounts AS (
	SELECT
		ft.city_id,
        dc.city_name,
        COUNT(ft.trip_id) AS total_trips
	FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name
)

(
    SELECT 'Top 3 Cities' AS category, city_id, city_name, total_trips 
    FROM CityTripCounts
    ORDER BY total_trips DESC
    LIMIT 3
);

# Bottom 3 Cities

WITH CityTripCounts AS (
	SELECT
		ft.city_id,
        dc.city_name,
        COUNT(ft.trip_id) AS total_trips
	FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name
)

(
	SELECT 'Bottom 3 Cities' AS category, city_id, city_name, total_trips
    FROM CityTripCounts
    ORDER BY total_trips ASC
    LIMIT 3
);

# Average fare per trip and trip distance by city 

WITH AvgFarePerTrip AS(
	SELECT ft.city_id,
			dc.city_name,
            AVG(ft.fare_amount) AS avg_fare,
            AVG(ft.distance_travelled_km) AS avg_trip_dist
	FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name
)

(
	 SELECT city_id, city_name, avg_fare, avg_trip_dist
     FROM AvgFarePerTrip
);

# Highest and lowest avg. fare per trip
WITH AvgFarePerTrip AS(
	SELECT ft.city_id,
			dc.city_name,
            AVG(ft.fare_amount) AS avg_fare,
            AVG(ft.distance_travelled_km) AS avg_trip_dist
	FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name
)
(
	 SELECT 'Highest Avg. Fare per Trip' as category, city_id, city_name, avg_fare
     FROM AvgFarePerTrip
     ORDER BY avg_fare DESC
     LIMIT 1
);
WITH AvgFarePerTrip AS(
	SELECT ft.city_id,
			dc.city_name,
            AVG(ft.fare_amount) AS avg_fare,
            AVG(ft.distance_travelled_km) AS avg_trip_dist
	FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name
)
(
	 SELECT 'Lowest Avg. Fare per Trip' as category, city_id, city_name, avg_fare
     FROM AvgFarePerTrip
     ORDER BY avg_fare ASC
     LIMIT 1
);


# Average ratings by City and Passengers
WITH CityRatings AS (
    SELECT 
        ft.city_id, 
        dc.city_name,
        ft.passenger_type,
        AVG(ft.passenger_rating) AS avg_passenger_rating,
        AVG(ft.driver_rating) AS avg_driver_rating
    FROM fact_trips ft
    JOIN dim_city dc ON ft.city_id = dc.city_id
    GROUP BY ft.city_id, dc.city_name, ft.passenger_type
)
SELECT * FROM (
    SELECT * FROM CityRatings ORDER BY avg_passenger_rating DESC LIMIT 1
) AS highest_passenger_rating
UNION ALL
SELECT * FROM (
    SELECT * FROM CityRatings ORDER BY avg_passenger_rating ASC LIMIT 1
) AS lowest_passenger_rating
UNION ALL
SELECT * FROM (
    SELECT * FROM CityRatings ORDER BY avg_driver_rating DESC LIMIT 1
) AS highest_driver_rating
UNION ALL
SELECT * FROM (
    SELECT * FROM CityRatings ORDER BY avg_driver_rating ASC LIMIT 1
) AS lowest_driver_rating;

