-- ========================================================================
-- Script:       personal_trainer_schema.sql
-- Purpose:      Defines schema for a personal training database in BigQuery.
--               Creates all core tables to support athlete tracking,
--               workout logs, nutrition logs, and program assignments.
-- 
-- Tables:
--   - athletes
--   - programs
--   - athlete_programs (relationship table)
--   - workout_log
--   - exercises
--   - workout_details (log of individual sets per workout)
--   - nutrition_log
--
-- Author:       Jasraj Singh Thiara
-- Created:      3rd August 2025
-- Environment:  BigQuery Standard SQL
-- Notes:
--   - Use `num_sets` instead of `sets` to avoid keyword conflicts.
--   - Foreign key constraints are declared but not enforced by BigQuery.
-- ========================================================================


-- 1. Create the Athlete table. This contains information for all athletes.
CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.athletes`(
  athlete_id INT64 NOT NULL,
  first_name STRING,
  last_name STRING,
  address STRING,
  date_of_birth DATE,
  gender STRING,
  height_cm FLOAT64,
  weight_kg FLOAT64,
  PRIMARY KEY (athlete_id) NOT ENFORCED # If duplicates are entered, that's fine; in traditional SQL, duplicates are entered 
);

-- 2. Create the programs table. This contains information which program the athlete is on, e.g. bulk, cut

CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.programs`(
  program_id INT64 NOT NULL,
  program_name STRING, # for example, bulk, cut
  description STRING,
  PRIMARY KEY(program_id) NOT ENFORCED
);

-- 3. Create Athlete-Programs table. Shows us which program the athlete is following 


CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.athlete_programs`(
  athlete_program_id INT64 NOT NULL,
  athlete_id INT64,
  program_id INT64,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (athlete_program_id) NOT ENFORCED,
  FOREIGN KEY (athlete_id) REFERENCES `atomic-lens-467915-q7.personal_training.athletes`(athlete_id) NOT ENFORCED,
  FOREIGN KEY (program_id) REFERENCES `atomic-lens-467915-q7.personal_training.athletes`(athlete_id) NOT ENFORCED
);

-- 4. Workout Log table. 

CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.workout_log`(
  workout_id INT64 NOT NULL,
  athlete_id INT64,
  workout_date DATE,
  duration_minutes INT64,
  notes STRING,
  PRIMARY KEY (workout_id) NOT ENFORCED,
  FOREIGN KEY (athlete_id) REFERENCES `atomic-lens-467915-q7.personal_training.athletes`(athlete_id) NOT ENFORCED
);

-- 5. Nutrition Log Table

CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.nutrition_log`(
  nutrition_log_id INT64 NOT NULL,
  athlete_id INT64,
  log_date DATE,
  calories INT64,
  protein_grams FLOAT64,
  carbs_grams FLOAT64,
  fat_grams FLOAT64,
  PRIMARY KEY (nutrition_log_id) NOT ENFORCED,
  FOREIGN KEY (athlete_id) REFERENCES `atomic-lens-467915-q7.personal_training.athletes`(athlete_id) NOT ENFORCED
);

--6. Exercises Table 

CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.exercises`(
  exercise_id INT64 NOT NULL,
  name STRING,
  category STRING,
  equipment STRING,
  PRIMARY KEY (exercise_id) NOT ENFORCED 
);

-- 7. Workout details table 
CREATE TABLE IF NOT EXISTS `atomic-lens-467915-q7.personal_training.workout_details`(
  workout_detail_id INT64 NOT NULL,
  workout_id INT64,
  exercise_id INT64,
  `sets` INT64, # SETS is a reserved keywords, so backticks have been used in this case
  reps INT64,
  weight_used_kg FLOAT64,
  PRIMARY KEY (workout_detail_id) NOT ENFORCED,
  FOREIGN KEY (workout_id) REFERENCES `atomic-lens-467915-q7.personal_training.workout_log`(workout_id) NOT ENFORCED,
  FOREIGN KEY (exercise_id) REFERENCES `atomic-lens-467915-q7.personal_training.exercises`(exercise_id) NOT ENFORCED
);



