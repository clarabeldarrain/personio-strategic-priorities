-- Create a new column
ALTER TABLE technicalcase.customer_mrr_nps_aggregated
ADD COLUMN Company_Size_Category STRING;

-- Add information to it
UPDATE technicalcase.customer_mrr_nps_aggregated
SET Company_Size_Category = CASE
    WHEN customer_mrr_nps_aggregated.Company_Size BETWEEN 0 AND 100 THEN 'Small'
    WHEN customer_mrr_nps_aggregated.Company_Size BETWEEN 101 AND 300 THEN 'Medium'
    ELSE 'Large'
END
WHERE TRUE;