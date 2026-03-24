-- QUESTÃO 1
SELECT i.ID, i.name, COUNT(t.course_id) AS [Number of sections]
FROM dbo.instructor i LEFT JOIN dbo.teaches t ON i.ID = t.ID
GROUP BY i.ID, i.name ORDER BY i.ID;

-- QUESTÃO 2
SELECT i.ID, i.name, 
    (SELECT COUNT(*) FROM dbo.teaches t WHERE t.ID = i.ID) AS [Number of sections]
FROM dbo.instructor i ORDER BY i.ID;

-- QUESTÃO 3
SELECT s.course_id, s.sec_id, s.semester, s.year, COALESCE(i.name, '-') AS name
FROM dbo.section s
LEFT JOIN dbo.teaches t ON s.course_id = t.course_id AND s.sec_id = t.sec_id AND s.semester = t.semester AND s.year = t.year
LEFT JOIN dbo.instructor i ON t.ID = i.ID
WHERE s.semester = 'Spring' AND s.year = 2010
ORDER BY s.course_id, s.sec_id, name;

-- QUESTÃO 4
IF OBJECT_ID('dbo.grade_points', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.grade_points (grade VARCHAR(2) PRIMARY KEY, points DECIMAL(2,1));
    INSERT INTO dbo.grade_points (grade, points) VALUES
    ('A+', 4.0), ('A', 3.7), ('A-', 3.4), ('B+', 3.1), ('B', 2.8), ('B-', 2.5), 
    ('C+', 2.2), ('C', 1.9), ('C-', 1.6), ('D', 1.0), ('F', 0.0);
END;

SELECT s.ID, s.name, c.title, c.dept_name, tk.grade, gp.points, c.credits, (gp.points * c.credits) AS [Pontos totais]
FROM dbo.student s
JOIN dbo.takes tk ON s.ID = tk.ID
JOIN dbo.course c ON tk.course_id = c.course_id
JOIN dbo.grade_points gp ON tk.grade = gp.grade
ORDER BY s.ID, c.title;

-- QUESTÃO 5
IF OBJECT_ID('dbo.coeficiente_rendimento', 'V') IS NOT NULL DROP VIEW dbo.coeficiente_rendimento;
GO
CREATE VIEW dbo.coeficiente_rendimento AS
SELECT s.ID, s.name, c.title, c.dept_name, tk.grade, gp.points, c.credits, (gp.points * c.credits) AS [Pontos totais]
FROM dbo.student s
JOIN dbo.takes tk ON s.ID = tk.ID
JOIN dbo.course c ON tk.course_id = c.course_id
JOIN dbo.grade_points gp ON tk.grade = gp.grade;