-- Atividade 07
-- Questão 1
CREATE LOGIN User_A WITH PASSWORD = 'PT3036103@';
CREATE LOGIN User_B WITH PASSWORD = 'PT3036103@';
CREATE LOGIN User_C WITH PASSWORD = 'PT3036103@';
CREATE LOGIN User_D WITH PASSWORD = 'PT3036103@';
CREATE LOGIN User_E WITH PASSWORD = 'PT3036103@';

CREATE USER User_A FOR LOGIN User_A;
CREATE USER User_B FOR LOGIN User_B;
CREATE USER User_C FOR LOGIN User_C;
CREATE USER User_D FOR LOGIN User_D;
CREATE USER User_E FOR LOGIN User_E;

-- Questão 2
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.student     TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.instructor  TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.course      TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.department  TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.section     TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.takes       TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.teaches     TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.advisor     TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.prereq      TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.time_slot   TO User_A WITH GRANT OPTION;

-- Questão 3
SELECT 
    pr.class_desc      AS permissao,
    obj.name           AS tabela,
    pr.state_desc      AS estado
FROM sys.database_permissions pr
JOIN sys.objects obj ON pr.major_id = obj.object_id
JOIN sys.database_principals dp ON pr.grantee_principal_id = dp.principal_id
WHERE dp.name = 'User_A'
ORDER BY obj.name, pr.class_desc;
