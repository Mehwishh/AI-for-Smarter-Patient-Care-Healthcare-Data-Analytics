-- SELECT * FROM patients
-- SELECT * FROM admissions
-- SELECT * FROM icustays

-- 1. How many patients are in the database?
SELECT Count(*)
FROM patients

-- 2. What is the gender distribution?
SELECT
    gender,
    COUNT(*) AS patient_count
FROM patients
GROUP BY gender;

-- 3. What are the youngest, oldest, and average ages?
SELECT  MIN(anchor_age) AS youngest_age,
    MAX(anchor_age) AS oldest_age,
    ROUND(AVG(anchor_age), 2) AS average_age
FROM patients;

-- 4. How many patients are in each anchor year group?
SELECT anchor_year_group ,count(*)
FROM patients
group by anchor_year_group 
ORDER BY anchor_year_group;

-- 5. How many hospital admissions are there?
SELECT count(*) total_admissions
From admissions;   



-- 6. What types of admissions are recorded?
SELECT
    admission_type,
    COUNT(*) 
FROM admissions
GROUP BY admission_type;

-- 7. Which patients have the most admissions?
SELECT
    subject_id,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY subject_id
ORDER BY admission_count DESC
LIMIT 10;
-- 8. How many admissions does each gender have?
SELECT
     p.gender,
    COUNT(a.hadm_id) AS admission_count
FROM  patients p
JOIN  admissions a
ON 
	p.subject_id = a.subject_id
GROUP BY p.gender
ORDER BY admission_count DESC;

-- 9. What is the average age of patients by gender?
SELECT
    gender,
    Round(AVG(anchor_age),2)  AS average_age
FROM patients
GROUP BY gender;

-- 10. How many ICU stays are recorded?
SELECT
    Count(*)  
FROM icustays      
