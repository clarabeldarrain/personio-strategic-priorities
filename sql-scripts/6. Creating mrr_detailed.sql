-- Add to the mrrnew table, the info of the customer_mrr_nps_aggregated table, by creating a new table
CREATE TABLE `titanium-octane-417510.technicalcase.mrr_detailed` AS
SELECT
  mrr.Company_ID, 
  mrr.Movement_Date,
  mrr.Movement_Type,
  mrr.Movement_Amount,
  mrr.Product,
  customer_mrr_nps_aggregated.Region,
  customer_mrr_nps_aggregated.Initial_MRR,
  customer_mrr_nps_aggregated.Company_Size_Category,
FROM
  `titanium-octane-417510.technicalcase.mrrnew` AS mrr
LEFT JOIN `titanium-octane-417510.technicalcase.customer_mrr_nps_aggregated` AS customer_mrr_nps_aggregated
USING(Company_ID);


-- Update mrr_detailed table to have downgrades as negative values
UPDATE `titanium-octane-417510.technicalcase.mrr_detailed`
SET Movement_Amount = 
    CASE 
        WHEN Movement_Type = 'Downgrade' THEN -1 * Movement_Amount
        ELSE Movement_Amount
    END
WHERE Movement_Type = 'Downgrade';