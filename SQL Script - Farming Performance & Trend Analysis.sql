-- DATA CLEANING
-- Check for NULL values in critical columns
SELECT *
FROM crop_yield
WHERE Crop_ID IS NULL OR Yield_Tons IS NULL;

SELECT *
FROM fertilizer_usage
WHERE Fertilizer_ID IS NULL OR Quantity_Kg_Per_Hectare IS NULL;

SELECT *
FROM pesticide_usage
WHERE Pesticide_ID IS NULL OR Application_Rate_Liters_Per_Hectare IS NULL;

SELECT *
FROM regional_details
WHERE Region_ID IS NULL OR Avg_Annual_Rainfall_mm IS NULL;

SELECT *
FROM weather_conditions
WHERE Weather_ID IS NULL OR Avg_Temperature_C IS NULL;

-- Check for duplicates in crop yield table
SELECT Crop_ID, COUNT(*)
FROM crop_yield
GROUP BY Crop_ID
HAVING COUNT(*) > 1;

-- Check for duplicates in the fertilizer usage table
SELECT Fertilizer_ID, COUNT(*)
FROM fertilizer_usage
GROUP BY Fertilizer_ID
HAVING COUNT(*) > 1;

-- Check for duplicates in the pesticide usage table
SELECT Pesticide_ID, COUNT(*)
FROM pesticide_usage
GROUP BY Pesticide_ID
HAVING COUNT(*) > 1;

-- Check for duplicates in the regional details table
SELECT Region_ID, COUNT(*)
FROM regional_details
GROUP BY Region_ID
HAVING COUNT(*) > 1;

-- Check for duplicates in the weather conditions table
SELECT Weather_ID, COUNT(*)
FROM weather_conditions
GROUP BY Weather_ID
HAVING COUNT(*) > 1;


-- Crop Yield Analysis 
-- How many crops are there?
SELECT COUNT(DISTINCT Crop_Name) as Total_crops
FROM crop_yield;

-- What is the total yield for each crop?
SELECT Crop_Name, SUM(Yield_Tons) AS Total_Yield
FROM crop_yield
GROUP BY Crop_Name
ORDER BY Total_Yield DESC;

-- What is the trend of yield over years for each crop?
SELECT Crop_Name, Year, ROUND(SUM(Yield_Tons),2) AS Total_Yield
FROM crop_yield
GROUP BY Year, Crop_Name
ORDER BY Year, Crop_Name;

-- Which region has the highest yield for each crop?
SELECT cy.Crop_Name, rd.Region_Name, rd.Country, ROUND(SUM(Yield_Tons),2) AS Total_Yield
FROM crop_yield as cy
INNER JOIN regional_details as rd
	    ON cy.Region_ID = rd.Region_ID
GROUP BY cy.Crop_Name, rd.Region_Name, rd.Country
ORDER BY Total_Yield DESC;

-- Regional Analysis 
-- How many countries are there?
SELECT COUNT(DISTINCT Country) as Total_countries
FROM regional_details;

-- What is the average annual rainfall for each region?
SELECT rd.Region_Name, rd.country, AVG(Total_Rainfall_mm) AS Average_rainfall
FROM weather_conditions as wc
INNER JOIN regional_details as rd
      ON wc.Region_ID = rd.Region_ID
GROUP BY rd.Region_Name, rd.country
ORDER BY Average_rainfall DESC;

-- Weather Impact Analysis
-- How many seasons are there?
SELECT COUNT(DISTINCT Season) as Total_seasons
FROM weather_conditions;

-- How do average temperatures vary by region and season?
SELECT rd.Region_Name, rd.Country, AVG(Avg_Temperature_C) AS Average_Temp
FROM weather_conditions as wc
INNER JOIN regional_details as rd
        ON wc.Region_ID = rd.Region_ID
GROUP BY rd.Country, rd.Region_Name
ORDER BY Average_Temp DESC;

-- Which regions experienced the highest total rainfall?
SELECT rd.Region_Name, rd.Country, ROUND(SUM(Total_Rainfall_mm),2) AS Total_Rainfall
FROM weather_conditions as wc
INNER JOIN regional_details as rd
        ON wc.Region_ID = rd.Region_ID
GROUP BY rd.Region_Name, rd.Country
ORDER BY Total_Rainfall DESC;

-- Fertilizer Usage Analysis 
-- How many Fertilizer types are there?
SELECT COUNT(DISTINCT fertilizer_type) as Total_fertilizer
FROM fertilizer_usage;

-- What is the total fertilizer usage by Type?
SELECT Fertilizer_Type, ROUND(SUM(Quantity_Kg_Per_Hectare),2) AS Total_fertilizer_Usage
FROM fertilizer_usage
GROUP BY Fertilizer_Type
ORDER BY Total_fertilizer_Usage DESC;

-- What are the Yearly Trends in Fertilizer Usage (Kgs/Ha)
SELECT Fertilizer_Type, Year, ROUND(SUM(Quantity_Kg_Per_Hectare),2) AS Total_fertilizer_Usage
FROM fertilizer_usage
GROUP BY Fertilizer_Type, Year
ORDER BY Year ASC;

-- Which crops receive the most fertilizer application?
SELECT cy.Crop_Name, ROUND(SUM(Quantity_Kg_Per_Hectare),2) AS Total_fertilizer_Usage
FROM fertilizer_usage as fu
INNER JOIN crop_yield as cy
		ON fu.Crop_ID = cy.Crop_ID
GROUP BY cy.Crop_Name
ORDER BY Total_fertilizer_Usage DESC;

-- Which region uses the most fertilizer overall?
SELECT rd.Region_Name, rd.Country, ROUND(SUM(Quantity_Kg_Per_Hectare),2) AS Total_fertilizer_Usage
FROM fertilizer_usage as fu
INNER JOIN regional_details as rd
		ON fu.Region_ID = rd.Region_ID
GROUP BY rd.Region_Name, rd.Country
ORDER BY Total_fertilizer_Usage DESC;

-- Pesticide Usage Analysis
-- How many Pesticide types are there?
SELECT COUNT(DISTINCT Pesticide_Type) as Total_pesticide
FROM pesticide_usage;

-- What is the Total Pesticide Application Rates by Type (L/Ha)
SELECT Pesticide_Type, ROUND(SUM(Application_Rate_Liters_Per_Hectare),2) AS Total_pesticide_Usage
FROM pesticide_usage
GROUP BY Pesticide_Type
ORDER BY Total_pesticide_Usage DESC;

-- What are the Yearly Trends in Pesticide Application (L/Ha)
SELECT Pesticide_Type, Year, ROUND(SUM(Application_Rate_Liters_Per_Hectare),2) AS Total_pesticide_Usage
FROM pesticide_usage
GROUP BY Pesticide_Type, Year
ORDER BY Year ASC;

-- Which crops receive the most pesticide application?
SELECT cy.Crop_Name, ROUND(SUM(Application_Rate_Liters_Per_Hectare),2) AS Total_pesticide_Usage
FROM pesticide_usage as pu
INNER JOIN crop_yield as cy
		ON pu.Crop_ID = cy.Crop_ID
GROUP BY cy.Crop_Name
ORDER BY Total_pesticide_Usage DESC;

-- Combined Analysis
-- How does rainfall affect crop yield?
SELECT 
    CASE 
        WHEN r.Avg_Annual_Rainfall_mm < 500 THEN 'Low Rainfall'
        WHEN r.Avg_Annual_Rainfall_mm BETWEEN 500 AND 1000 THEN 'Moderate Rainfall'
        ELSE 'High Rainfall'
    END AS Rainfall_Category,
    r.Country,ROUND(AVG(c.Yield_Tons), 2) AS Avg_Yield_Tons
FROM Crop_Yield c
INNER JOIN regional_details r
    ON c.Region_ID = r.Region_ID
GROUP BY r.Country,Rainfall_Category
ORDER BY Avg_Yield_Tons DESC;

-- How does Temperature affect crop yield
SELECT 
    CASE 
        WHEN w.Avg_Temperature_C < 15 THEN 'Low Temperature'
        WHEN w.Avg_Temperature_C BETWEEN 15 AND 25 THEN 'Moderate Temperature'
        ELSE 'High Temperature'
    END AS Temperature_Category,
    r.Country, c.Crop_Name,
    ROUND(AVG(c.Yield_Tons), 2) AS Avg_Yield_Tons
FROM Crop_Yield c
INNER JOIN regional_details r
    ON c.Region_ID = r.Region_ID
INNER JOIN weather_conditions w
    ON r.Region_ID = w.Region_ID
GROUP BY r.Country, Temperature_Category,c.Crop_Name
ORDER BY Avg_Yield_Tons DESC;



