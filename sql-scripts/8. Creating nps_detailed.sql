-- Add to the mrrnew table, the info of the customer_mrr_nps_aggregated table, by creating a new table
CREATE TABLE `titanium-octane-417510.technicalcase.nps_detailed` AS
SELECT
  nps.Company_ID, 
  nps.Data_Received,
  nps.NPS_Score, 
  mrr.Movement_Date,
  mrr.Movement_Type,
  mrr.Movement_Amount,
  mrr.Product,
FROM
  `titanium-octane-417510.technicalcase.nps` AS nps
LEFT JOIN `titanium-octane-417510.technicalcase.mrrnew` AS mrr
USING(Company_ID);


-- Add column for PWA
ALTER TABLE `titanium-octane-417510.technicalcase.nps_detailed`
ADD COLUMN Is_PWA STRING;

-- Populate the New Column
UPDATE `titanium-octane-417510.technicalcase.nps_detailed`
SET 
  Is_PWA = CASE WHEN Product = 'People Workflow Automation' THEN 'Yes' ELSE 'No' END
WHERE TRUE;

-- Add Column to see Movement Pre-Votes and Post-Votes
ALTER TABLE `titanium-octane-417510.technicalcase.nps_detailed`
ADD COLUMN Movement_Relative_To_NPS STRING;

-- Populate the New Column
UPDATE `titanium-octane-417510.technicalcase.nps_detailed`
SET Movement_Relative_To_NPS = CASE
    WHEN Movement_Date < Data_Received THEN 'Before'
    WHEN Movement_Date > Data_Received THEN 'After'
    WHEN Movement_Date = Data_Received THEN 'Same Day'
    ELSE NULL
END
WHERE TRUE;

-- Update customer_mrr table to have downgrades as negative values
UPDATE `titanium-octane-417510.technicalcase.nps_detailed`
SET Movement_Amount = 
    CASE 
        WHEN Movement_Type = 'Downgrade' THEN -1 * Movement_Amount
        ELSE Movement_Amount
    END
WHERE movement_type = 'Downgrade';
