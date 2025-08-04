-- ========================================================================
-- Script:       analysis.sql
-- Purpose:      Runs useful exploratory and analytical queries on athlete data
--               Demonstrates use of BigQuery native functions
--
-- Author:       Jasraj Singh Thiara
-- Created:      3rd August 2025
-- Environment:  BigQuery Standard SQL
-- ========================================================================

-- ========================================================================
-- JOIN queries
-- ========================================================================

-- 1.  View Athletes and Program Information

SELECT 
  a.athlete_id,
  a.first_name,
  a.last_name,
  p.program_name,
  ap.start_date,
  ap.end_date
FROM `personal_training.athletes` a
INNER JOIN `personal_training.athlete_programs` ap ON a.athlete_id = ap.athlete_id
INNER JOIN `personal_training.programs` p ON ap.program_id = p.program_id;

-- 2.Average Daily Nutrition by Program

SELECT 
  p.program_name,
  ROUND(AVG(n.calories), 2) AS avg_calories,
  ROUND(AVG(n.protein_grams), 2) AS avg_protein,
  ROUND(AVG(n.carbs_grams), 2) AS avg_carbs,
  ROUND(AVG(n.fat_grams), 2) AS avg_fat
FROM `personal_training.nutrition_log` n
INNER JOIN `personal_training.athletes` a ON a.athlete_id = n.athlete_id
INNER JOIN `personal_training.athlete_programs` ap ON a.athlete_id = ap.athlete_id
INNER JOIN `personal_training.programs` p ON ap.program_id = p.program_id
GROUP BY p.program_name;

-- 3. Workout Volume by Athlete

SELECT 
  a.athlete_id,
  CONCAT(a.first_name, ' ', a.last_name) AS athlete_name,
  SUM(wd.sets) AS total_sets,
  SUM(wd.reps) AS total_reps
FROM `personal_training.workout_details` wd
INNER JOIN `personal_training.workout_log` wl ON wd.workout_id = wl.workout_id
INNER JOIN `personal_training.athletes` a ON wl.athlete_id = a.athlete_id
GROUP BY a.athlete_id, athlete_name
ORDER BY total_sets DESC;

-- ========================================================================
-- WINDOW queries
-- ========================================================================

-- 4. Rank Athletes by Total Sets Performed, per program

-- Great for comparing volume within context — who's pulling their weight in the Bulk program vs. Cut.

SELECT 
  a.athlete_id,
  CONCAT(a.first_name, ' ', a.last_name) AS athlete_name,
  p.program_name,
  SUM(wd.sets) AS total_sets,
  ROW_NUMBER() OVER (
    PARTITION BY p.program_name 
    ORDER BY SUM(wd.sets) DESC
  ) AS program_rank
FROM `personal_training.workout_details` wd
INNER JOIN `personal_training.workout_log` wl ON wd.workout_id = wl.workout_id
INNER JOIN `personal_training.athletes` a ON wl.athlete_id = a.athlete_id
INNER JOIN `personal_training.athlete_programs` ap ON a.athlete_id = ap.athlete_id
INNER JOIN `personal_training.programs` p ON ap.program_id = p.program_id
GROUP BY a.athlete_id, athlete_name, p.program_name;


-- 5. Calories vs Moving Average Over Time

SELECT 
  athlete_id,
  log_date,
  calories,
  ROUND(
    AVG(calories) OVER (
      PARTITION BY athlete_id 
      ORDER BY log_date 
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2
  ) AS calories_3_day_avg
FROM `personal_training.nutrition_log`
ORDER BY athlete_id, log_date;




