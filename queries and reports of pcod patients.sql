use kvytla;

# 1 question : indentify the average age of patients with PCOD and their main reason of visit to hospital 
SELECT 
    ROUND(AVG(age)) AS average_age,
    (SELECT reason_for_visit
        FROM encountertable
        GROUP BY reason_for_visit
        ORDER BY COUNT(*) DESC
        LIMIT 1) AS most_common_reason_for_visitpatient
FROM patient; 
#returned one row 

# 2 question : identify the Average Calorie Intake of PCOD patients by age group
SELECT ROUND(AVG(Calorieintake)) AS average_calorie_intake,
 FLOOR(p.age / 10) * 10 AS age_group
FROM diet 
JOIN patient p ON Patientkey_FK = p.patientkey
GROUP BY age_group;
# returned 2 rows 


#-3  QUESTION :  INDENTIFY THE Average BODY MASS INDEX  by Age Group;
 
  SELECT CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age >= 20 AND age < 30 THEN '20-29'
        WHEN age >= 30 AND age < 40 THEN '30-39'
        WHEN age >= 40 AND age < 50 THEN '40-49'
        ELSE '50 and above'
       END AS age_group,
       AVG(bc.bodymassindex) AS avg_bmi
FROM patient p
JOIN bodycomposition bc ON p.patientkey = Patientkey_FK
GROUP BY age_group
ORDER BY age_group;
# returned 2 rows

#---question 4: Summary of Billing Charges by Diagnosis

SELECT diagnosis, AVG(Billing_charge) AS average_billing_charge
FROM  encountertable
JOIN billing b ON Billingkey= Billing_FK
GROUP BY diagnosis;
#returned 13 rows 

#--question 5 : Depression Levels and Their Impact on PCOD Treatment Effectiveness

SELECT Treatment, AVG(depression) AS average_depression
FROM mentalstatus
JOIN encountertable ON Patientkey_FK = Patient_FK
GROUP BY treatment;
# returned 19 rows


#---question 6 :Correlation Between Diet and Hormone Levels
SELECT d.Calorieintake, AVG(h.insulinlevel) AS avg_insulin_level
FROM diet d
JOIN harmone h ON d.Patientkey_FK =  h.patientkey_FK
GROUP BY d.calorieintake;
# returned 7 rows

# ---question 7 : Estrogen Levels in Patients with Infertility Issues
SELECT 
AVG(estrogenlevel) AS avg_estrogen_level
FROM harmone h
JOIN disease d  ON h.patientkey_FK = d.patientkey_FK
WHERE d.infertility= 'Yes';

  #--question 8 :  Patients who have both irregular menstrual cycles and high anxiety levels (using HAVING):

SELECT p.firstname, p.lastname
FROM patientp p
JOIN mentalstatus ms ON p.patientkey = ms.Patientkey_FK
JOIN mensturalcycle mc ON p.patientkey = mc.Patientkey_FK
WHERE mc.irregularities = 'Yes'
GROUP BY p.firstname, p.lastname
HAVING AVG(ms.anxiety) > 5;
# returned 6 rows

 #---question 9 :Patients who adhere to medication and have an average anxiety level below 5 (using UNION)

(SELECT p.firstname, p.lastname
FROM patientp p
JOIN medication m ON p.patientkey = m.patient_fk
WHERE m.adherence = 'Yes')
UNION
(SELECT p.firstname, p.lastname
FROM patientp p
JOIN mentalstatus ms ON p.patientkey = ms.Patientkey_FK
GROUP BY p.firstname, p.lastname
HAVING AVG(ms.anxiety) < 5);
# returned 7 rows

#---question 10 : Patients who have both irregular menstrual cycles and high anxiety levels

SELECT p.firstname, p.lastname
FROM patientp p
JOIN mentalstatus ms ON p.patientkey = ms.Patientkey_FK
JOIN mensturalcycle mc ON p.patientkey = mc.Patientkey_FK
WHERE mc.irregularities = 'Yes'
AND ms.anxiety > 7;
#returned 1 row 









