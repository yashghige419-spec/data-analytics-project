create database ola;
use ola;
# Retrieving all successful bookings
create view successful_bookings As
select * from bookings where booking_status='success';
select * from successful_bookings ;

# Finding the average ride distance for each vehicle type
create view ride_Distance_for_each_vehicle As
select vehicle_type, avg(ride_distance) as avg_distance_tranvelled from bookings group by vehicle_type;
select * from ride_Distance_for_each_vehicle;

# the total number of cancelled rides by customers:
create view total_number_canceled_rides_by_customer As
select count(*) from bookings 
where booking_status='canceled by customer';
select * from total_number_canceled_rides_by_customer ;


# top 5 customers who booked the highest number of rides:
create view top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC limit 5;
select *from   top_5_customers ;


# number of rides cancelled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_due_to_p_c as
select count(*) from bookings 
where Canceled_Rides_by_Driver='Personal & Car related issue';
select *from rides_canceled_by_drivers_due_to_p_c;


#  maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_rating as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan' ;
select * from min_max_rating ;

#  Retrieving all rides where payment was made using UPI:
create view upi_method as
SELECT * FROM bookings WHERE Payment_Method = 'UPI';
select * from upi_method ;


#  average customer rating per vehicle type:
create view avg_customer_rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;
select * from avg_customer_rating ;


#  total booking value of rides completed successfully:
create view total_ooking_value_of_rides_completed_successfully as
SELECT SUM(Booking_Value) as total_successful_value FROM bookings WHERE
Booking_Status = 'Success';
select * from total_ooking_value_of_rides_completed_successfully ;


# all incomplete rides along with the reason
create view incomplete_rides_reason as
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides =
'Yes';
select * from incomplete_rides_reason;
