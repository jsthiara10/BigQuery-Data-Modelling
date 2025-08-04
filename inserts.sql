-- =============================
-- Insert sample programs
-- Script:       inserts.sql
-- Purpose:      Inserts initial synthetic data into our personal training database tables

-- Author:       Jasraj Singh Thiara
-- Created:      3rd August 2025
-- Environment:  BigQuery Standard SQL
-- =============================
-- =========================================

-- =========================================
-- Insert athletes
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.athletes` (
  athlete_id, first_name, last_name, address, date_of_birth, gender, height_cm, weight_kg
) VALUES
(101, 'Leah', 'Kim', '14 Maple Ave, London', DATE '1997-06-21', 'F', 167.5, 61.2),
(102, 'Marcus', 'Wells', '22 Queens St, Southall', DATE '1989-11-02', 'M', 180.4, 78.9),
(103, 'Aisha', 'Khan', '77 Elm Rd, Slough', DATE '1995-03-10', 'F', 172.2, 66.5),
(104, 'Raj', 'Patel', '5 Victoria Rd, Leicester', DATE '1992-08-15', 'M', 175.0, 70.0),
(105, 'Emily', 'Stone', '12 Beach Dr, Brighton', DATE '1990-01-26', 'F', 165.3, 59.0),
(106, 'Jake', 'Murphy', '81 Hillview St, Manchester', DATE '1996-07-05', 'M', 182.8, 84.3),
(107, 'Nina', 'Singh', '3 Regent St, Birmingham', DATE '1994-09-19', 'F', 170.1, 64.4),
(108, 'Tom', 'Watson', '100 High St, Glasgow', DATE '1987-05-30', 'M', 177.2, 75.8),
(109, 'Sara', 'Lopez', '44 Oxford Rd, Cambridge', DATE '1999-12-12', 'F', 160.8, 55.5),
(110, 'Daniel', 'Nguyen', '7 Royal Lane, Bristol', DATE '1991-03-23', 'M', 185.0, 88.6);

-- =========================================
-- Insert training program information
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.programs` (
  program_id, program_name, description
) VALUES
(1, 'Bulk', 'Muscle building with calorie surplus and heavy lifting'),
(2, 'Cut', 'Fat reduction with cardio focus and calorie control'),
(3, 'Maintain', 'Balanced program for sustaining current fitness');

-- =========================================
-- Map athletes to programs
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.athlete_programs` (
  athlete_program_id, athlete_id, program_id, start_date, end_date
) VALUES
(1001, 101, 1, DATE '2025-07-01', DATE '2025-09-30'),
(1002, 102, 2, DATE '2025-08-01', DATE '2025-10-15'),
(1003, 103, 3, DATE '2025-06-15', DATE '2025-08-15'),
(1004, 104, 1, DATE '2025-07-10', DATE '2025-09-10'),
(1005, 105, 3, DATE '2025-08-01', DATE '2025-09-30'),
(1006, 106, 2, DATE '2025-07-20', DATE '2025-10-01'),
(1007, 107, 1, DATE '2025-07-25', DATE '2025-09-25'),
(1008, 108, 2, DATE '2025-07-30', DATE '2025-10-05'),
(1009, 109, 3, DATE '2025-08-05', DATE '2025-09-20'),
(1010, 110, 1, DATE '2025-07-15', DATE '2025-09-15');

-- =========================================
-- Insert workout log information
-- =========================================


INSERT INTO `atomic-lens-467915-q7.personal_training.workout_log` (
  workout_id, athlete_id, workout_date, duration_minutes, notes
) VALUES
(5001, 101, DATE '2025-08-02', 45, 'Upper body strength'),
(5002, 102, DATE '2025-08-03', 30, 'HIIT circuit'),
(5003, 103, DATE '2025-08-03', 60, 'Full-body compound lifts'),
(5004, 104, DATE '2025-08-04', 40, 'Leg day'),
(5005, 105, DATE '2025-08-05', 50, 'Core and mobility'),
(5006, 106, DATE '2025-08-06', 30, 'Cardio burn'),
(5007, 107, DATE '2025-08-07', 55, 'Push workout'),
(5008, 108, DATE '2025-08-08', 60, 'Back and biceps'),
(5009, 109, DATE '2025-08-09', 35, 'Plyometric focus'),
(5010, 110, DATE '2025-08-10', 45, 'Upper body circuit');

-- =========================================
-- Insert nutrition log information
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.nutrition_log` (
  nutrition_log_id, athlete_id, log_date, calories, protein_grams, carbs_grams, fat_grams
) VALUES
(7001, 101, DATE '2025-08-02', 2500, 140.0, 300.0, 80.0),
(7002, 102, DATE '2025-08-03', 1800, 100.0, 150.0, 65.0),
(7003, 103, DATE '2025-08-03', 2200, 120.0, 200.0, 70.0),
(7004, 104, DATE '2025-08-04', 2400, 130.0, 290.0, 75.0),
(7005, 105, DATE '2025-08-05', 2000, 110.0, 180.0, 60.0),
(7006, 106, DATE '2025-08-06', 1900, 105.0, 160.0, 58.0),
(7007, 107, DATE '2025-08-07', 2450, 135.0, 310.0, 78.0),
(7008, 108, DATE '2025-08-08', 1850, 100.0, 170.0, 65.0),
(7009, 109, DATE '2025-08-09', 2100, 115.0, 200.0, 72.0),
(7010, 110, DATE '2025-08-10', 2600, 145.0, 320.0, 85.0);

-- =========================================
-- Insert exercise information
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.exercises` (
  exercise_id, name, category, equipment
) VALUES
(301, 'Squat', 'Legs', 'Barbell'),
(302, 'Bench Press', 'Chest', 'Barbell'),
(303, 'Lat Pulldown', 'Back', 'Machine'),
(304, 'Burpees', 'Cardio', 'None'),
(305, 'Deadlift', 'Back', 'Barbell'),
(306, 'Plank', 'Core', 'None'),
(307, 'Overhead Press', 'Shoulders', 'Dumbbell'),
(308, 'Lunges', 'Legs', 'None'),
(309, 'Rowing Machine', 'Cardio', 'Machine'),
(310, 'Bicep Curl', 'Arms', 'Dumbbell');


-- =========================================
-- Insert workout session details
-- =========================================

INSERT INTO `atomic-lens-467915-q7.personal_training.workout_details` (
  workout_detail_id, workout_id, exercise_id, `sets`, reps, weight_used_kg
) VALUES
(9001, 5001, 302, 3, 10, 40.0),
(9002, 5002, 304, 5, 15, 0.0),
(9003, 5003, 301, 4, 12, 60.0),
(9004, 5004, 308, 3, 12, 0.0),
(9005, 5005, 306, 3, 60, 0.0),
(9006, 5006, 309, 4, 15, 0.0),
(9007, 5007, 307, 3, 10, 22.5),
(9008, 5008, 307, 3, 10, 23.5),
(9009, 5009, 307, 3, 12, 24.5),
(9010, 5010, 307, 3, 10, 25.5)
;




