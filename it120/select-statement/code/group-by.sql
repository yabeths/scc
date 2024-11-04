-- Total transactions by fuel type

SELECT 
    FuelTypePrimary,
    COUNT(*) AS TransactionCount
FROM 
    registration
GROUP BY 
    FuelTypePrimary
ORDER BY 
    TransactionCount DESC;

