SELECT * FROM climate_change;

--CHECK DUPLICATE VALUE
SELECT record_id
FROM climate_change
GROUP BY record_id
HAVING COUNT(*) >1;

--UPDATE INDA TO INDIA 
UPDATE climate_change
SET country ='India'
WHERE country ='Inda';

--CHECK FOR NULL VALUES
SELECT * 
FROM climate_change
WHERE record_id IS NULL
OR date IS NULL
OR country IS NULL
OR city IS NULL
OR temperature_c IS NULL
OR humidity_percent IS NULL
OR precipitation_mm IS NULL
OR air_quality_index IS NULL  
OR extreme_weather_events IS NULL
OR climate_classification IS NULL
OR climate_zone IS NULL
OR biome_type IS NULL
OR heat_index IS NULL
OR wind_speed IS NULL
OR wind_direction IS NULL
OR season IS NULL
OR population_exposure IS NULL
OR economic_impact_estimate IS NULL
OR infrastructure_vulnerability_score IS NULL;

--UPDATE population_exposure
UPDATE climate_change
SET population_exposure = 5275135
WHERE record_id = 'aus_1338';

--UPDATE city
UPDATE climate_change
SET city ='Toronto'
WHERE record_id = 'cnd_227';

--DATA ANALYTICS 
-- Q1 MONTHLY TEMPERATURE TRENDS
SELECT TO_CHAR(date,'Month') AS month_name, AVG(temperature_c)AS avg_temp
FROM climate_change
GROUP BY TO_CHAR(date,'Month'),EXTRACT(Month FROM date)
ORDER BY EXTRACT (Month FROM date);

--Q2 AVG TEMPERATURE BY COUNTRY 
SELECT country, AVG(temperature_c) AS avg_temp
FROM climate_change
GROUP BY country
ORDER BY avg_temp DESC;

--Q3 EXTREME WEATHER EVENTS OVER TIME
SELECT TO_CHAR(date,'Month')AS month_name, COUNT(*) AS event_count
FROM climate_change
WHERE extreme_weather_events <> 'None'
GROUP BY TO_CHAR(date,'Month')
ORDER BY event_count DESC;

--Q4 COUNTRYWISE EXTREME WEATHER EVENTS
SELECT country,COUNT(*)AS event_count
FROM climate_change
WHERE extreme_weather_events <> 'None'
GROUP BY country
ORDER BY event_count DESC;

--Q5 RELATIONSHIP BETWEEN TEMPERATURE AND EXTREME WEATHER EVENTS
SELECT
CASE
WHEN temperature_c < 10 THEN 'Very Cold (<10°C)'
WHEN temperature_c BETWEEN 10 AND 15 THEN 'Cold (10-15°C)'
WHEN temperature_c BETWEEN 15 AND 20 THEN 'Moderate (15-20°C)'
WHEN temperature_c BETWEEN 20 AND 25 THEN 'Warm (20-25°C)'
ELSE 'Hot (>25°C)'
END AS Temperature_Range,
extreme_weather_events,
COUNT(*) AS Event_Count
FROM climate_change
WHERE extreme_weather_events <> 'None'
GROUP BY Temperature_Range, extreme_weather_events
ORDER BY Temperature_Range, Event_Count DESC;

-- Q6 which cities are experiencing extreme weather events this week and what are their economic and population impacts?
SELECT country,city,extreme_weather_events,COUNT(*) AS Event_type,
ROUND(AVG(temperature_c), 1) AS Average_temperature,
SUM(population_exposure) AS Total_population_exposure,
SUM(economic_impact_estimate) AS Total_economic_impact,
ROUND(AVG(infrastructure_vulnerability_score), 0) AS Average_vulnerability
FROM climate_change
WHERE date BETWEEN '2025-03-03' AND '2025-03-07'
AND extreme_weather_events != 'None'
GROUP BY country,city,extreme_weather_events
ORDER BY Total_economic_impact DESC;

--Q7 what are the top 5 cities with the highest air quality concerns and their associate risks?
SELECT country,city,ROUND(AVG(air_quality_index), 0)AS Average_AQI,
COUNT(*) AS Days_above_200_AQI,
SUM(population_exposure) as Total_Population_Exposure,
ROUND(avg(temperature_c), 1) as Average_Temperature
from climate_change
WHERE date BETWEEN '2025-03-03' AND '2025-03-07'
GROUP BY country,city
HAVING AVG (air_quality_index) > 100
ORDER BY Average_AQI
LIMIT 5;

--Q8 Which biome types are most risk from extreme weather events this week?
SELECT biome_type,
count(*) as Total_Records,
count(distinct concat(country,city)) as Locations_Affected,
count(case when extreme_weather_events != 'None' then 1 end) as Extreme_WeatherCount,
STRING_AGG(DISTINCT extreme_weather_events , ', ') as Event_Types,
Round(avg(temperature_c), 1) as Average_Temperature,
sum(economic_impact_estimate) as Total_Economic_Impact_Estimate,
Round(Avg(infrastructure_vulnerability_score), 0) as Average_Vulnerability
from climate_change
where date between '2025-03-03' and '2025-03-07'
group by biome_type;

