
-- List all bookings with customer and vehicle details
SELECT
  booking_id,
  users.name AS customer_name,
  vehicles.name AS vehicle_name,
  start_date,
  end_date,
  bookings.status
FROM
  bookings
  INNER JOIN users ON bookings.user_id = users.user_id
  INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id


-- Find vehicles that have never been booked
  SELECT
  *
FROM
  vehicles
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      bookings
    WHERE
      bookings.vehicle_id = vehicles.vehicle_id
  )

-- Find all available cars
  SELECT * FROM vehicles WHERE status ='available' AND type = 'car';

-- Count total bookings per vehicle and list vehicles with more than 2 bookings
  SELECT vehicles.name AS vehicle_name , 
 COUNT(bookings.booking_id) AS total_bookings
  FROM bookings INNER JOIN vehicles
   USING(vehicle_id) 
    GROUP BY vehicles.name
      HAVING COUNT (bookings.booking_id) > 2;