-- Update customer_mrr_nps table to have downgrades as negative values
UPDATE `titanium-octane-417510.technicalcase.customer_mrr_nps`
SET Movement_Amount = 
    CASE 
        WHEN Movement_Type = 'Downgrade' THEN -1 * Movement_Amount
        ELSE Movement_Amount
    END
WHERE movement_type = 'Downgrade';

-- Update customer_mrr table to have downgrades as negative values
UPDATE `titanium-octane-417510.technicalcase.customer_mrr`
SET Movement_Amount = 
    CASE 
        WHEN Movement_Type = 'Downgrade' THEN -1 * Movement_Amount
        ELSE Movement_Amount
    END
WHERE movement_type = 'Downgrade';