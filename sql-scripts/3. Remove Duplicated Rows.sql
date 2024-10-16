-- As customer_mrr_nps has too many rows for each Company_ID, we want to create a new table to have one row per Company ID
CREATE TABLE `titanium-octane-417510.technicalcase.customer_mrr_nps_aggregated` AS
SELECT 
  Company_ID,
  ANY_VALUE(Company_Name) AS Company_Name,
  ANY_VALUE(Industry) AS Industry,
  ANY_VALUE(Initial_MRR) AS Initial_MRR,
  ANY_VALUE(Company_Size) AS Company_Size,
  ANY_VALUE(Activation_Date) AS Activation_Date,
  ANY_VALUE(Churn_Date) AS Churn_Date,
  ANY_VALUE(Region) AS Region,

  -- For Movement_Date take into account only the last date
  MAX(Movement_Date) AS Last_Movement_Date,
  
  -- For Movement_Amount
  CASE 
    WHEN SUM(CASE WHEN Movement_Amount IS NOT NULL THEN 1 ELSE 0 END) = 0 THEN NULL    -- If the sum is 0, leave it as null
    WHEN SUM(Movement_Amount) > 0 THEN 'Upgrade'    -- If the sum is positive, show upgrade
    ELSE 'Downgrade'    -- If not, show downgrade
  END AS Movement_Type,
  
  -- Sum all Movement_Amount
  SUM(Movement_Amount) AS Total_Movement_Amount,
  
  -- For NPS_Date take into account only the last date
  MAX(NPS_Date) AS Last_NPS_Date,

  -- For NPS_Score calculate an average
  AVG(NPS_Score) AS Average_NPS_Score,

  -- Extract Month from Activation, Churn, MRR Movement and NPS for future visualisation
  EXTRACT(MONTH FROM ANY_VALUE(Activation_Date)) AS Activation_Month,
  EXTRACT(MONTH FROM ANY_VALUE(Churn_Date)) AS Churn_Month,
  EXTRACT(MONTH FROM MAX(Movement_Date)) AS Movement_Month,
  EXTRACT(MONTH FROM MAX(NPS_Date)) AS NPS_Month
FROM 
  `titanium-octane-417510.technicalcase.customer_mrr_nps`
GROUP BY 
  Company_ID;

