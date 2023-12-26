-- SELECT TRIM(phone_number) AS trimmed_string,
 -- LENGTH(TRIM(phone_number)) AS Length_phone_number
 -- FROM employee;
 -- page 9 sol
-- SELECT town_name , COUNT(*) AS employee_count
--  FROM employee
-- GROUP BY town_name
-- ORDER BY employee_count DESC;
-- ----------------------------------------
-- Page 10
-- SELECT *
-- FROM employee
  -- SELECT assigned_employee_id , COUNT(*) AS number_visits
  -- FROM visits
  -- GROUP BY assigned_employee_id
  -- ORDER BY number_visits ASC
  -- LIMIT 2;
-- employee _id number_visits
-- 1	3708
-- 30	3676
-- 34	3539
-- 1-> Bello Azibo	+99643864786	bello.azibo@ndogowater.gov	129 Ziwa La Kioo Road	Kilimani
-- 30-> Pili Zola	+99822478933	pili.zola@ndogowater.gov	46 Stone Town Street	Hawassa	Zanzibar	Field Surveyor
-- 34 -> Rudo Imani	+99046972648	rudo.imani@ndogowater.gov	15 Lake Malawi Avenue	Kilimani	Ilanga	Field Surveyor
-- Page 11

-- SELECT town_name, COUNT(*) AS town_count
-- FROM location
-- GROUP BY town_name
-- Harare	1650
-- Kintampo	780
-- Lusaka	1070
-- Rural	23740
-- Abidjan	400
-- Amina	1090
-- Asmara	930
-- Bello	400
-- Dahabu	930
-- Pwani	520
-- Deka	350
-- Djenne	310
-- Serowe	480
-- Yaounde	270
-- Zanzibar	300
-- Amara	710
-- Isiqalo	770
-- Mrembo	990
-- Zuri	750
-- Bahari	470
-- Cheche	370
-- Ilanga	780
-- Kofi	510
-- Majengo	620
-- Marang	460
-- SELECT province_name, COUNT(*) AS town_count
-- FROM location
 -- GROUP BY province_name
-- Akatsi	8940
-- Amanzi	6950
-- Hawassa	6030
-- Kilimani	9510
-- Sokoto	8220
-- Page 12
-- SELECT province_name, town_name, COUNT(*) AS records_per_town
-- FROM location

-- GROUP BY province_name, town_name
-- ORDER BY province_name, records_per_town DESC;
-- Page 13
-- SELECT location_type, COUNT(*) as num_sources
-- From location
 -- GROUP BY location_type
-- ORDER BY num_sources;
-- Page 15
 -- Select 
 -- SUM(number_of_people_served) AS Total_Served_people
 -- From water_source
-- SELECT type_of_water_source, COUNT(*) AS water_source_type_count,AVG(number_of_people_served) AS avg_population_served

-- FROM water_source
-- GROUP BY type_of_water_source
-- ORDER BY avg_population_served DESC;
-- SELECT source_id,type_of_water_source, SUM(number_of_people_served) AS total_of_people_served,ROUND((SUM(number_of_people_served)/27628140)*100,0) as Rounded_percentage,
-- RANK() OVER( ORDER BY SUM(number_of_people_served)DESC) AS rank_by_population

-- FROM water_source
-- GROUP BY source_id
-- ORDER BY Rounded_percentage DESC;
-- page24
-- SELECT
-- type_of_water_source,
--   source_id,SUM(number_of_people_served), 
--   rank() OVER (
 --   PARTITION BY type_of_water_source
 --    order by SUM(number_of_people_served) DESC
 --  ) AS priority_rank
-- FROM water_source
-- Group by source_id
-- ORDER BY type_of_water_source ;
-- ------------------------------
-- page 26 (problem)
-- SELECT
 -- DATEDIFF(day,'2021-01-01','2021-01-18') AS range_record
-- FROM visits
-- order by time_of_record;
-- Page 28
-- SELECT AVG(NULLIF(time_in_queue, 0)) AS average_queue_time
-- FROM visits;
-- -------------------
-- Page29
-- SELECT
 --  DAYNAME(time_of_record) AS day_of_week,
 --  ROUND(AVG(NULLIF(time_in_queue, 0)),0) AS average_queue_time
-- FROM visits
-- GROUP BY DAYNAME(time_of_record)
-- --------------
-- Page 30
-- SELECT
--  HOUR(time_of_record) AS hour_of_day,
--  Round(AVG(time_in_queue),0)
-- FROM visits
-- WHERE time_in_queue > 0
-- GROUP BY HOUR(time_of_record)
-- ORDER BY hour_of_day;
-- SELECT
-- DAYNAME(time_of_record) AS day_of_week,
-- Sunday
-- ROUND(AVG(
-- CASE
-- WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
-- ELSE NULL
-- END
-- ),0) AS Sunday,
-- Monday
-- ROUND(AVG(
-- CASE
-- WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
-- ELSE NULL
-- END
-- ),0) AS Monday,
-- ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue ELSE NULL END), 0) AS Tuesday,
 --  ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue ELSE NULL END), 0) AS Wednesday,
-- ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue ELSE NULL END), 0) AS Thursday,
--   ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue ELSE NULL END), 0) AS Friday,
--   ROUND(AVG(CASE WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue ELSE NULL END), 0) AS Saturday
-- FROM
-- visits
-- WHERE
-- time_in_queue != 0 -- this excludes other sources with 0 queue times
-- GROUP BY
-- time_of_record

-- ORDER BY DAYNAME(time_of_record);
SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END
),0) AS Sunday,
-- Monday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
ELSE NULL
END
),0) AS Monday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
ELSE NULL
END
),0) As Tueday,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
ELSE NULL
END
),0) As Wednesday
-- Tuesday
-- Wednesday
FROM
visits
WHERE
time_in_queue != 0 -- this excludes other sources with 0 queue times
GROUP BY
hour_of_day
ORDER BY
hour_of_day