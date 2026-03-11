/* Consultas SQL - número de registros por tabela */

Select count(*) as student_count from student; /* 2000 registros */

Select count(*) as takes_count from takes; /* 30000 registros */

Select count(*) as course_count from course; /* 200 registros */

Select count(*) as instructor_count from instructor; /* 50 registros */

Select count(*) as department_count from department; /* 20 registros */

Select count(*) as advisor_count from advisor; /* 2000 registros */

Select count(*) as classroom_count from classroom;/* 30 registros */

Select count(*) as section_count from section; /* 100 registros */

Select count(*) as teaches_count from teaches; /* 100 registros */

Select count(*) as prereq_count from prereq; /* 100 registros */

Select count(*) as time_slot_count from time_slot; /* 20 registros */
