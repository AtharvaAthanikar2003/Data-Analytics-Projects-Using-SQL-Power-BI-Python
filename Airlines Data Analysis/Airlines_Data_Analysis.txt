-- Use and Show DB Airlines_Flight_Data
USE Airlines_Flight_Data;
SELECT * FROM airlines_flights_data;

-- Q1a. Find the longest route travelled from source to destination city with duration
SELECT TOP 1 
    source_city, 
    destination_city,
    duration
FROM airlines_flights_data
ORDER BY duration DESC;

-- Q1b. Convert the duration from decimal to actual hrs (hh:mm:ss) format
SELECT TOP 1
    source_city,
    destination_city,
	stops,
    duration,
    -- Convert float hours to HH:MM:SS
    RIGHT('0' + CAST((CAST(duration * 3600 AS INT) / 3600) AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST(((CAST(duration * 3600 AS INT) % 3600) / 60) AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST((CAST(duration * 3600 AS INT) % 60) AS VARCHAR(2)), 2) AS duration_hhmmss
FROM airlines_flights_data
ORDER BY duration DESC;

-- Q2a. Find the shortest route travelled from source to destination city with duration
SELECT TOP 1 
    source_city, 
    destination_city, 
    duration
FROM airlines_flights_data
ORDER BY duration ASC;  

-- Q2b. Convert the shortest duration from decimal to actual hrs (hh:mm:ss) format
SELECT TOP 1
    source_city,
    destination_city,
	stops,
    duration,
    -- Convert float hours to HH:MM:SS
    RIGHT('0' + CAST((CAST(duration * 3600 AS INT) / 3600) AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST(((CAST(duration * 3600 AS INT) % 3600) / 60) AS VARCHAR(2)), 2) + ':' +
    RIGHT('0' + CAST((CAST(duration * 3600 AS INT) % 60) AS VARCHAR(2)), 2) AS duration_hhmmss
FROM airlines_flights_data
ORDER BY duration ASC;

-- Q3. Find the highest ticket price with airline, source, and destination
SELECT TOP 1
    airline,
    source_city,
    destination_city,
    price AS highest_ticket_price
FROM airlines_flights_data
WHERE price = (SELECT MAX(price) FROM airlines_flights_data);

-- Q4. Count the total number of flights
SELECT COUNT(*) AS total_flights FROM airlines_flights_data;

-- Q5. List all airlines (distinct)
SELECT DISTINCT airline FROM airlines_flights_data;

-- Q6. Count the total number of unique airlines
SELECT COUNT(DISTINCT airline) AS total_airlines FROM airlines_flights_data;

-- Q7. Number of flights whose destination city is Mumbai
SELECT COUNT(*) AS flights_to_mumbai
FROM airlines_flights_data
WHERE destination_city = 'Mumbai';

-- Q8. Number of flights having Chennai as source city
SELECT COUNT(*) AS flights_from_chennai
FROM airlines_flights_data
WHERE source_city = 'Chennai';

-- Q9. Find the lowest ticket price with airline, source, and destination
SELECT TOP 1
    airline,
    source_city,
    destination_city,
    price AS lowest_ticket_price
FROM airlines_flights_data
WHERE price = (SELECT MIN(price) FROM airlines_flights_data);

-- Q10. List of flights scheduled in the morning batch (departure_time = 'morning')
SELECT
    airline,
    flight,
    source_city,
    destination_city,
	departure_time,
	Dept_Time
FROM airlines_flights_data
WHERE departure_time = 'morning';