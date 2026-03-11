/*Atividade 03*/

/*Questão 01*/
select * from student s
full outer join takes t
on s.ID = t.ID;

/*Questão 02*/
select st.ID, st.Name, ta.[Quantidade de cursos] 
from (select s.ID, s.Name from student s where s.dept_name = 'Civil Eng.') as st
left join (select ID, count(course_id) as "Quantidade de cursos"
from takes group by ID) as ta
on ta.id = st.id
order by [Quantidade de cursos] desc;

/*Questão 03*/
create view civil_eng_students as
select st.ID, st.Name, ta.[Quantidade de cursos] 
from (select s.ID, s.Name from student s where s.dept_name = 'Civil Eng.') as st
left join (select ID, count(course_id) as "Quantidade de cursos"
from takes group by ID) as ta
on ta.id = st.id;
