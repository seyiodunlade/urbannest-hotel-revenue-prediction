-- CREATE DATABASE UrbanNest;

-- USE UrbanNest;

-- 1. Which room types generate the highest average revenue?
SELECT reserved_room_type, ROUND(AVG(total_revenue), 2) AS avg_revenue
FROM hotel_bookings
GROUP BY reserved_room_type
ORDER BY avg_revenue DESC;

-- 2a. Which months or seasons have the highest booking activity?
-- a. Which months have the highest booking activity?
SELECT arrival_date_month, COUNT(booking_id) AS total_bookings
FROM hotel_bookings
GROUP BY arrival_date_month
ORDER BY total_bookings DESC;

-- b. Booking activity by season
SELECT season, COUNT(booking_id) AS total_bookings
FROM (
    SELECT 
        booking_id,
        CASE 
            WHEN arrival_date_month IN ('December', 'January', 'February') THEN 'Winter'
            WHEN arrival_date_month IN ('March', 'April', 'May')           THEN 'Spring'
            WHEN arrival_date_month IN ('June', 'July', 'August')          THEN 'Summer'
            WHEN arrival_date_month IN ('September', 'October', 'November') THEN 'Autumn'
        END AS season
    FROM hotel_bookings
) AS seasonal_bookings
GROUP BY season
ORDER BY total_bookings DESC;

-- 3. What is the average revenue for different customer segments?
SELECT market_segment, ROUND(AVG(total_revenue), 2) AS avg_revenue
FROM hotel_bookings
GROUP BY market_segment
ORDER BY avg_revenue DESC;

-- 4. Which hotel type generates the highest average revenue?
SELECT 
    hotel,
    ROUND(AVG(total_revenue), 2) AS avg_revenue,
    COUNT(booking_id) AS total_bookings
FROM hotel_bookings
GROUP BY hotel
ORDER BY avg_revenue DESC;

-- 5. What is the cancellation rate by market segment?
SELECT 
    market_segment,
    COUNT(booking_id) AS total_bookings,
    SUM(CAST(is_canceled AS INT)) AS total_cancellations,
    ROUND(
        CAST(SUM(CAST(is_canceled AS INT)) AS FLOAT) / COUNT(booking_id) * 100, 2
        ) AS cancellation_rate
FROM hotel_bookings
GROUP BY market_segment
ORDER BY cancellation_rate DESC;

-- 6. Which distribution channel generates the highest average revenue?
SELECT 
    distribution_channel,
    ROUND(AVG(total_revenue), 2) AS avg_revenue,
    COUNT(booking_id) AS total_bookings
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY avg_revenue DESC;

-- 7. What is the average lead time for cancelled vs non cancelled bookings?
SELECT 
    CASE WHEN is_canceled = 1 THEN 'Cancelled' 
         ELSE 'Not Cancelled' 
    END AS booking_status,
    ROUND(AVG(lead_time), 0) AS avg_lead_time,
    COUNT(booking_id) AS total_bookings
FROM hotel_bookings
GROUP BY is_canceled
ORDER BY avg_lead_time DESC;

-- 8. What are the top 10 countries by total revenue?
SELECT TOP 10
    country,
    ROUND(SUM(total_revenue), 2) AS total_revenue,
    COUNT(booking_id) AS total_bookings
FROM hotel_bookings
GROUP BY country
ORDER BY total_revenue DESC;