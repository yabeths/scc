-- Count of Distinct Makes

SELECT 
    COUNT(DISTINCT Make) AS DistinctMakeCount
FROM 
    registration;

--Distinct Vehicle Colors

SELECT DISTINCT 
    Color
FROM 
    registration;