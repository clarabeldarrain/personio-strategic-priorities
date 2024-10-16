
-- Add the month columns
ALTER TABLE `titanium-octane-417510.technicalcase.customer_mrr_nps`
ADD COLUMN Activation_Month INT64,
ADD COLUMN Churn_Month INT64,
ADD COLUMN Movement_Month INT64,
ADD COLUMN NPS_Month INT64;


-- Update the new columns with the month extracted from the existing date columns in customer_mrr_nps
UPDATE `titanium-octane-417510.technicalcase.customer_mrr_nps`
SET 
    Activation_Month = EXTRACT(MONTH FROM Activation_Date),
    Churn_Month = CASE WHEN Churn_Date IS NOT NULL THEN EXTRACT(MONTH FROM Churn_Date) END,
    Movement_Month = CASE WHEN Movement_Date IS NOT NULL THEN EXTRACT(MONTH FROM Movement_Date) END,
    NPS_Month = EXTRACT(MONTH FROM NPS_Date)
WHERE TRUE;

