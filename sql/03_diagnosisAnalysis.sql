-- 16. How many diagnosis records exist?
SELECT COUNT(*) AS diagnosis_records
FROM diagnoses_icd;

-- 17. Which ICD diagnosis codes occur most frequently?
select icd_code, count (*) as  most_frequent_icd_code
from diagnoses_icd
group by icd_code
order by most_frequent_icd_code desc 
limit 10g;

-- 18. What are the actual descriptions of the most common diagnoses?

-- join  and count
-- d_icd_diagnoses           discription
-- diagnoses_icd			   icd_code

select a.icd_code, b.long_title as description ,
count (*) as  most_common_icd_code
from  diagnoses_icd a
join d_icd_diagnoses b
on 
   a.icd_code=b.icd_code
group by a.icd_code, b.long_title
having  count(*)>1
order by  most_common_icd_code desc 
limit 10;

-- 19. Which patients have the most diagnoses?

select subject_id,  
count (*) as diagnosis_count
from  diagnoses_icd 
group by subject_id
order by  diagnosis_count desc 
limit 10;


-- 20. How many different diagnosis codes are recorded?
select count(distinct icd_code) 
from diagnoses_icd