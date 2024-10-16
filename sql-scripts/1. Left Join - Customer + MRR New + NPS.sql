-- Add to the customers table, the info of mrr movements of the customers acquired this period
CREATE TABLE `titanium-octane-417510.technicalcase.customer_mrr` AS
SELECT
  customer.Company_ID, 
  customer.Company_Name,
  customer.Industry,
  customer.Initial_MRR,
  customer.Company_Size,
  customer.Activation_Date,
  customer.Churn_Date,
  customer.Region,
  mrr.Movement_Date,
  mrr.Movement_Type,
  mrr.Movement_Amount,
  mrr.Product
FROM
  `titanium-octane-417510.technicalcase.customer` AS customer
LEFT JOIN `titanium-octane-417510.technicalcase.mrrnew` AS mrr
USING(Company_ID);


-- Add to the customers_mrr table, the info of nps scores of the customers acquired this period
CREATE TABLE `titanium-octane-417510.technicalcase.customer_mrr_nps` AS
SELECT
  customer_mrr.Company_ID, 
  customer_mrr.Company_Name,
  customer_mrr.Industry,
  customer_mrr.Initial_MRR,
  customer_mrr.Company_Size,
  customer_mrr.Activation_Date,
  customer_mrr.Churn_Date,
  customer_mrr.Region,
  customer_mrr.Movement_Date,
  customer_mrr.Movement_Type,
  customer_mrr.Movement_Amount,
  customer_mrr.Product,
  nps.Data_Received AS NPS_Date,
  nps.NPS_Score
FROM
  `titanium-octane-417510.technicalcase.customer_mrr` AS customer_mrr
LEFT JOIN `titanium-octane-417510.technicalcase.nps` AS nps
USING(Company_ID);

