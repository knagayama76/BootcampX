const { Pool } = require("pg");

const pool = new Pool({
  user: "kaorunagayama",
  password: "password",
  host: "localhost",
  database: "bootcampx",
});

pool.connect(() => {
  console.log("Connected to database!");
});

const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teacher;
`;

const cohortName = process.argv[2] || "JUL02";
const values = [cohortName];

pool.query(queryString, values).then((res) => {
  res.rows.forEach((row) => {
    console.log(`${row.cohort}: ${row.teacher}`);
  });
});
