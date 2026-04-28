-- Questão 1
GRANT SELECT (ID, name, dept_name, hire_date) ON dbo.instructor TO User_B;
GRANT SELECT (ID, course_id, sec_id, semester, year) ON dbo.takes TO User_B;

-- Questão 2
GRANT SELECT (course_id, sec_id, semester, year),
      INSERT (course_id, sec_id, semester, year),
      UPDATE (course_id, sec_id, semester, year)
ON dbo.section TO User_C;

-- Questão 3
GRANT SELECT ON dbo.instructor   TO User_D;
GRANT SELECT ON dbo.student      TO User_D;
GRANT SELECT ON dbo.grade_points TO User_D;

-- Questão 4
GRANT SELECT ON dbo.student TO User_E;

-- Questão 5
REVOKE SELECT ON dbo.student FROM User_E;

-- Questão 6
SELECT
    dp.name         AS usuario,
    obj.name        AS objeto,
    pr.class_desc   AS tipo_objeto,
    pr.permission_name AS permissao,
    pr.column_id    AS coluna_id,
    col.name        AS coluna,
    pr.state_desc   AS estado
FROM sys.database_permissions pr
JOIN sys.database_principals dp  ON pr.grantee_principal_id = dp.principal_id
JOIN sys.objects obj             ON pr.major_id = obj.object_id
LEFT JOIN sys.columns col        ON pr.major_id = col.object_id
                                AND pr.minor_id = col.column_id
WHERE dp.name IN ('User_A', 'User_B', 'User_C', 'User_D', 'User_E')
ORDER BY dp.name, obj.name, col.name;
