
-- 11. What is the average hospital stay?

SELECT ROUND(AVG(EXTRACT(EPOCH FROM (dischtime::timestamp - admittime::timestamp)) / 86400 ), 2) AS average_stay_days
FROM admissions
WHERE dischtime IS NOT NULL
  AND admittime IS NOT NULL;



-- 12 Which admission type has the longest average hospital stay
SELECT
    admission_type,
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    dischtime::timestamp - admittime::timestamp
                )
            ) / 86400
        ),
        2
    ) AS average_stay_days
FROM admissions
WHERE dischtime IS NOT NULL
  AND admittime IS NOT NULL
GROUP BY admission_type
ORDER BY average_stay_days DESC;


-- 14. How many patients were admitted to the ICU?
SELECT COUNT(DISTINCT subject_id) AS icu_patients
FROM icustays;

-- 15. Which patients had more than one admission?

Select subject_id ,count(*) As admission_count
FROM admissions
Group by subject_id
Having count(*)>1
ORDER BY admission_count DESC;

where filters rows before grouping, while:
Having filters groups after aggregation.


