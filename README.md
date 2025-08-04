# BigQuery Data Modelling

![Image](https://github.com/user-attachments/assets/e7a0b89d-144b-407d-b88d-d55ff273353f)

BigQuery data modelling and database design project

# 🏋️‍♂️ Personal Training Database — BigQuery Example

## 📘 Project Purpose

This project demonstrates **data modeling and database design in BigQuery**, using the context of a **personal training system**. It showcases how to structure a relational schema that is normalized, efficient, and extensible — but the core design is adaptable to nearly any use case (e.g., inventory systems, health apps, CRM, etc.).

---

## 📂 Files in This Repository

| File                      | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| `personal_trainer_schema.sql` | Creates all necessary tables with appropriate keys and constraints.         |
| `inserts.sql` | Inserts synthetic data into all core tables to simulate a real-world workflow. |
| `analysis.sql` | Provides useful queries for analysis in BigQuery-native SQL. |

---

## 🏗️ Schema Overview

The schema consists of 7 interconnected tables:

1. `athletes`: Personal information and training history of each client.
2. `programs`: Types of training programs (e.g., Bulking, Cutting).
3. `athlete_programs`: Many-to-one relationship mapping athletes to their chosen program.
4. `workout_log`: High-level workout sessions for each athlete.
5. `workout_details`: Breakdown of exercises performed during each workout.
6. `exercises`: Exercise reference table.
7. `nutrition_log`: Daily calorie and macronutrient tracking.

---

## Entity-Relationship Diagram

![Image](https://github.com/user-attachments/assets/897d9863-a789-43de-ae82-6f846d1300cc)

Here is an Entity-Relationship diagram which visually describes how the tables in our database are connected

For example, Athletes table connects to the Nutrition log table via the Foreign Key of athlete_id

**PK: Primary Key ** (unique identifier for rows in that specific table)

**FK: Foreign Key **  (key that links one table to the other)

---

## 🛠️ BigQuery-Specific Features Used

- ✅ `CREATE TABLE IF NOT EXISTS`: Ensures idempotent table creation.
- 🔑 Foreign key relationships (`REFERENCES`) — though not enforced by default in BigQuery, still useful for documentation and data governance.
- 📊 Window functions like `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()` (in upcoming queries).
- 🧠 `CASE`, `COALESCE`, and other native SQL functions for logic and defaulting.
- 📅 Usage of `DATE` type and ISO date formatting for clarity and compatibility.

---

## 🔄 Future Extensions

This schema was kept lean for clarity, but the following additions could enhance realism:
- `sessions`: One-off or recurring PT session tracking
- `trainers`: If there are multiple personal trainers
- `progress_log`: Weight, body fat %, performance tracking over time
- `medical_history`: Injuries or health conditions relevant to programming

---

## 🚀 Getting Started

**Important: Please change the project name prefix to reflect your unique project name in Google Cloud e.g. atomic-lens-467915-q7**

To get started:
1. Create a new dataset in BigQuery (e.g., `personal_training`)
2. Run `personaltrainer_schema.sql` to create all tables
3. Run `inserts.sql` to populate with sample data
4. Use the `analysis.sql` to practice querying, aggregation, ranking, and more.

---

## 🧠 Why This Matters

Understanding database design and structured query logic is essential for:
- Analysts and data engineers designing efficient pipelines
- Building systems that scale with user or customer data
- Supporting downstream analytics and business intelligence

This project demonstrates good practices in **normalisation, schema clarity, and query readiness** — all in a tool (BigQuery) used at production scale in the real world.

---

## 📬 Contact

Jasraj Singh Thiara https://www.linkedin.com/in/jasrajsinghthiara/

Feel free to fork, modify, or submit issues and suggestions. Future contributions and dataset expansions are welcome!
