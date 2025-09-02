CREATE TABLE australia_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM australia_climate_data

CREATE TABLE brazil_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM brazil_climate_data 

CREATE TABLE canada_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM canada_climate_data

CREATE TABLE germany_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM germany_climate_data

CREATE TABLE india_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM india_climate_data

CREATE TABLE south_africa_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM south_africa_climate_data

CREATE TABLE usa_climate_data (
    record_id VARCHAR(10),
    date DATE,
    country VARCHAR(100),
    city VARCHAR(100),
    temperature_c NUMERIC(5,2),
    humidity_percent NUMERIC(5,2),
    precipitation_mm NUMERIC(6,2),
    air_quality_index INTEGER,
    extreme_weather_events VARCHAR(255),
    climate_classification VARCHAR(100),
    climate_zone VARCHAR(50),
    biome_type VARCHAR(100),
    heat_index NUMERIC(5,2),
    wind_speed NUMERIC(5,2),
    wind_direction VARCHAR(20),
    season VARCHAR(20),
    population_exposure INTEGER,
    economic_impact_estimate NUMERIC(15,2),
    infrastructure_vulnerability_score NUMERIC(4,2)
);

SELECT * FROM usa_climate_data


--create a combined table
CREATE TABLE climate_change AS
SELECT * FROM australia_climate_data
UNION
SELECT * FROM brazil_climate_data
UNION
SELECT * FROM canada_climate_data
UNION
SELECT * FROM germany_climate_data
UNION
SELECT * FROM india_climate_data
UNION
SELECT * FROM south_africa_climate_data
UNION
SELECT * FROM usa_climate_data;
