use satellite_db;
#Q1.  Display the names of all satellites and their countries
SELECT official_name_of_satellite, country_of_operator_owner
FROM satellite_data;

#Q2.Show satellites used for Military purposes
SELECT official_name_of_satellite, users
FROM satellite_data
WHERE users = 'Military';

#Count how many satellites are in LEO orbit
SELECT COUNT(*) AS total_leo_satellites
FROM satellite_data
WHERE class_of_orbit = 'LEO';

#4.Display satellites with apogee greater than 1000 km
SELECT official_name_of_satellite, apogee_km
FROM satellite_data
WHERE apogee_km > 1000;

#Q5. Show details of satellites operated by the USA
SELECT official_name_of_satellite, purpose, launch_vehicle
FROM satellite_data
WHERE country_of_operator_owner = 'USA';



#Q6. Count total satellites for each country
SELECT country_of_operator_owner, COUNT(*) AS total_satellites
FROM satellite_data
GROUP BY country_of_operator_owner;


#Q7. Find the satellite with the highest power output
SELECT official_name_of_satellite, power_watts
FROM satellite_data
ORDER BY power_watts DESC
LIMIT 1;

#Q8. Display satellites launched after 2015
SELECT official_name_of_satellite, date_of_launch
FROM satellite_data
WHERE YEAR(STR_TO_DATE(date_of_launch,'%m/%d/%Y')) > 2015;


#Q9. Calculate the average launch mass
SELECT AVG(launch_mass_kg) AS average_launch_mass
FROM satellite_data;


#Q10.Show all distinct orbit types
SELECT DISTINCT type_of_orbit
FROM satellite_data;


#Q11. Display the top 5 satellites with the highest launch mass
SELECT official_name_of_satellite, launch_mass_kg
FROM satellite_data
ORDER BY launch_mass_kg DESC
LIMIT 5;

#Q12. Count satellites based on their purpose
SELECT purpose, COUNT(*) AS total
FROM satellite_data
GROUP BY purpose
ORDER BY total DESC;


#Q13. Find satellites where the difference between apogee and perigee is greater than 5000 km
SELECT official_name_of_satellite,
       perigee_km,
       apogee_km,
       (apogee_km - perigee_km) AS difference_km
FROM satellite_data
WHERE (apogee_km - perigee_km) > 5000;

#Q14. Count how many times each launch vehicle was used
SELECT launch_vehicle, COUNT(*) AS usage_count
FROM satellite_data
GROUP BY launch_vehicle
ORDER BY usage_count DESC;

#Q15. Compare the number of satellites operated by Russia and USA
SELECT country_of_operator_owner, COUNT(*) AS total
FROM satellite_data
WHERE country_of_operator_owner IN ('Russia', 'USA')
GROUP BY country_of_operator_owner;