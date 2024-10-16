-- Add column for Payroll Analysis
ALTER TABLE `titanium-octane-417510.technicalcase.mrr_detailed`
ADD COLUMN Is_Payroll STRING,                          -- Yes / No , If customer added or removed payroll
ADD COLUMN Ratio_Movement_Amount_Initial_MRR FLOAT64,  -- Value (Less than 1 or More or equal than 1) , Movement_Amount / Inital_MRR, to check if revenue has doubled
ADD COLUMN Ratio_Result STRING;                        -- Yes / No , if revenue of client has doubled or not


-- Update the Table
UPDATE `titanium-octane-417510.technicalcase.mrr_detailed`
SET 
  Is_Payroll = CASE WHEN Product = 'Payroll' THEN 'Yes' ELSE 'No' END,
  Ratio_Movement_Amount_Initial_MRR = CASE WHEN Product = 'Payroll' THEN Movement_Amount / Initial_MRR ELSE NULL END
WHERE TRUE;

-- One Decimal in Ratio_Movement_Amount_Initial_MRR
UPDATE `titanium-octane-417510.technicalcase.mrr_detailed`
SET 
  Ratio_Movement_Amount_Initial_MRR = ROUND(Ratio_Movement_Amount_Initial_MRR, 2)
WHERE 
  Ratio_Movement_Amount_Initial_MRR IS NOT NULL;

  -- Update the Table
UPDATE `titanium-octane-417510.technicalcase.mrr_detailed`
SET 
  Ratio_Result = CASE 
                   WHEN Product = 'Payroll' AND Ratio_Movement_Amount_Initial_MRR >= 1.00 THEN 'Yes'
                   WHEN Product = 'Payroll' AND Ratio_Movement_Amount_Initial_MRR < 1.00 THEN 'No'
                   ELSE NULL 
                 END
WHERE TRUE;
