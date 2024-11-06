SELECT * FROM  customerdatacsv

SELECT region, COUNT(DISTINCT CustomerName) AS total_customers
FROM customerdatacsv
GROUP BY region;

SELECT SubscriptionType, 
    COUNT(CustomerID) AS num_customers
FROM 
    customerdatacsv
GROUP BY 
    SubscriptionType
ORDER BY 
    num_customers DESC
LIMIT 1;

SELECT 
    CustomerID, 
    subscription_start_date, 
    subscription_end_date,
    DATEDIFF(month, subscription_start_date, subscription_end_date) AS subscription_duration_months
FROM 
    customerdatacsv
WHERE 
    DATEDIFF(month, subscription_start_date, subscription_end_date) <= 6 
    AND subscription_status = 'canceled';

 SELECT 
    AVG(DATEDIFF(month, SubscriptionStart, SubscriptionEnd)) AS avg_subscription_duration_months
FROM 
    customerdatacsv;

SELECT 
    CustomerID, 
    SubscriptionStart, 
    SubscriptionEnd
FROM 
    customerdatacsv
WHERE 
    DATEDIFF(month, SubscriptionStart, SubscriptionEnd) > 12;

SELECT 
    SubscriptionType, 
    SUM(Revenue) AS total_revenue
FROM 
    customerdatacsv
GROUP BY 
    SubscriptionType;

	SELECT 
    region, 
    COUNT(CustomerID) AS cancellations
FROM 
    customerdatacsv
JOIN 
    CustomerName ON customerdatacsv.CustomerID = CustomerName.CustomerID
WHERE 
    Canceled = 'TRUE'
GROUP BY 
    Region
ORDER BY 
cancellations DESC
LIMIT 3;

SELECT 
    Canceled, 
    COUNT(CustomerID) AS total_subscriptions
FROM 
    customerdatacsv
GROUP BY 
    Canceled;
