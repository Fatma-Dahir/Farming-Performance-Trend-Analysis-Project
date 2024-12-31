# 📊 Farming Performance & Trend Analysis Project
![Interactive   Dynamic Power BI Dashboard](https://github.com/user-attachments/assets/46282fb3-a334-4c74-bf37-d370501071eb)

# Project Overview
This project analyzes key factors that affect crop yields for Rice, Wheat, Maize, Cotton, Sugarcane, Barley, and Soybean across Nigeria, USA, India, Brazil, and China. By examining crop performance, regional practices, and the impact of weather, the aim is to identify strategies for boosting productivity and reducing waste. The goal is to provide practical recommendations for farmers and regions to grow food more sustainably and efficiently.
SQL was used for data cleaning and analysis, with Power BI employed to create dynamic, interactive dashboards that highlight key insights.

# Methodology
For this project, I used SQL for data cleaning and analysis and Microsoft Power BI to create interactive dashboards and visualizations to explore factors affecting crop yields and productivity across various countries.

# Data Cleaning
In this phase, I performed the following tasks:
1. Imported the Data into MySQL Workbench using the Import Table Wizard
2. Checked for null values and duplicate records, ensuring data quality, and standardized the data for consistency and analysis

# Exploratory Data Analysis
I used SQL to conduct the following analyses on the data:

- How many crops are there?
- What is the total yield for each crop?
- Which region has the highest yield for each crop?
- How many countries are there in the dataset?
- What is the average annual rainfall for each region?
- How many seasons are there?
- How do average temperatures vary by region and season?
- Which regions experienced the highest total rainfall?
- How many fertilizer types are there?
- What is the total fertilizer usage by type?
- What are the yearly trends in fertilizer usage (Kgs/Ha)?
- Which crops receive the most fertilizer application?
- Which region uses the most fertilizer overall?
- How many pesticide types are there?
- What is the total pesticide application rates by type (L/Ha)?
- What are the yearly trends in pesticide application (L/Ha)?
- Which crops receive the most pesticide application?
- How does rainfall affect crop yield?
- How does temperature affect crop yield?

The SQL script is available in the repository for reference.

# Results and Findings

## Crop Yield Analysis

### Crop Performance:
• There are 7 crops covered in the project: Rice, Cotton, Barley, Soybeans, Sugarcane, Maize, and Wheat.  
• Rice leads with 14.91% of total yields, contributing 4,113.43 tons, surpassing Wheat by 8.68%.  
• Cotton occupies the largest cultivated area at 2,100.88 hectares, while Rice achieves the highest total yield.

### Regional Insights:
• The project covers 5 countries: Nigeria, USA, Brazil, India, and China. Each country has 5 regions: East, West, South, North, and Central, except Brazil, which has 4 regions: East, South, North, and Central.  
• Nigeria leads in total yield with 6,387.32 tons, followed by the USA at 6,302.83 tons, and India at 5,855.24 tons.  
• In the USA, the South region outperformed other areas with 3,323.41 tons (12.05% of total yields), while the Central region recorded the lowest yield at 235.38 tons.

## Weather Impact Analysis

### Temperature Insights:
• From 2018 to 2023, the average temperature ranged from 21.99°C to 22.79°C across all six years.  
• The highest average temperature occurred in 2018 at 22.79°C, which was 3.62% higher than the lowest average temperature in 2020 (21.99°C).  
• The USA had the highest average temperature of 22.94°C among all the countries in the dataset, with total yields of 6,302.83 tons, while Nigeria achieved the highest total yield of 6,387.32 tons, with an average temperature of 22.08°C.  
• Among all the regions covered, East Brazil recorded the highest average temperature.

### Rainfall Insights:
• Total rainfall across all regions in the six years reached 1.39 million mm.  
• Nigeria recorded the highest total rainfall among all the countries in the dataset, with 325,489.45 mm, accounting for 23.47% of the total rainfall, followed by the USA at 300,464.32 mm, India at 294,092.35 mm, Brazil at 234,458.50 mm, and China at 232,276.32 mm.  
• Regions with high rainfall recorded the highest total yields at 16,481.06 tons, followed by moderate rainfall at 6,905 tons, and low rainfall at 4,197.31 tons.  
• Among all the regions covered, South USA region recorded the highest rainfall.

### Seasonal Insights:
• There are 3 seasons covered in the project: Monsoon, Summer, and Winter.  
• The Monsoon season recorded the highest total yield at 9,487.93 tons, followed by Summer with 9,229.39 tons, and Winter with 8,866.05 tons.

## Fertilizer and Pesticide Analysis

### Fertilizer Usage:
• There are 4 types of fertilizers: Nitrogen, Organic, Potassium, and Phosphorus.  
• A total of 546.42K kg of fertilizer was applied per hectare.  
• Nitrogen fertilizer was the most used, contributing 25.50% of the total applied at 139,317.88 kg per hectare.  
• Organic, Potassium, and Phosphorus fertilizers followed in descending order, with Phosphorus having the lowest total usage (132,355.08 kg), which is 5.26% less than Nitrogen.  
• Rice receives the highest fertilizer application, with 68,913.32 kg per hectare, followed by Cotton at 67,548.20 kg per hectare.  
• South USA region has the highest fertilizer usage, applying 59,096.63 kg per hectare.

### Pesticide Application:
• There are 3 types of pesticides: Fungicides, Insecticides, and Herbicides.  
• A total of 12.67K liters of pesticide were applied.  
• Fungicides led with 4,299.73 liters per hectare, followed by Insecticides (4,265.36 liters) and Herbicides (4,102.20 liters).  
• Soybeans lead in pesticide application, with 1,622.49 liters per hectare, followed by Barley at 1,535.81 liters per hectare.

# Recommendations

1. **Crop Management:**  
• **Expand Rice Cultivation:** Focus on increasing Rice cultivation in high-yield, favorable regions.  
• **Diversify Cultivation:** Introduce modern farming techniques and resilient crop varieties to improve yields in underperforming regions like Central USA.

2. **Weather Adaptation:**  
• **Rainfall Efficiency:** Invest in rainwater harvesting and soil moisture management in high rainfall areas; use efficient irrigation in moderate rainfall regions.  
• **Temperature Management:** Use heat-tolerant crops and improved irrigation in hot regions like the USA and Brazil.  
• **Seasonal Strategies:** Align planting schedules with Monsoon and Summer seasons for optimal yields.

3. **Fertilizer Optimization:**  
• **Nitrogen Management:** Optimize nitrogen use to avoid over-application and soil depletion; balance with complementary nutrients like phosphorus and potassium.  
• **Promote Organic Fertilizers:** Focus on organic fertilizers to improve soil health and reduce chemical dependence.  
• **Precision Agriculture:** Use Geographic Information Systems (GIS) to identify nutrient-deficient areas and apply fertilizers selectively.

4. **Pesticide Usage:**  
• **Targeted Spraying:** Apply pesticides only in pest hotspots to reduce overall application and explore Integrated Pest Management (IPM).  
• **Optimal Timing:** Time pesticide applications for critical growth stages or high pest activity to minimize usage.  
• **Companion Planting:** Consider companion planting strategies (e.g., using marigolds to repel pests and deter nematodes) to reduce reliance on chemical pesticides, especially for crops like Soybeans and Barley, which have higher pesticide applications.
