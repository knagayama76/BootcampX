CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);


-- Create a folder called migrations within the BootcampX folder.
-- Inside migrations, create a new file called students_cohorts.sql
-- Take a moment to try writing the CREATE TABLE statements yourself for students and cohorts. Use the ERD to help.
-- Once you've given it a try, toggle the code block below to reveal our version of the code.
-- Make sure the code in your students_cohorts.sql file is identical to the code below.