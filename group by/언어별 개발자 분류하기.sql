WITH PY AS (
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME = 'Python'
),
CP AS(
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME = 'C#'
),
FE AS (
    SELECT SUM(CODE) AS CODE
    FROM SKILLCODES 
    WHERE CATEGORY = 'Front End'
)

SELECT IF(SKILL_CODE & PY.CODE AND SKILL_CODE & FE.CODE, 'A',
          IF(SKILL_CODE & CP.CODE, 'B',
            IF(SKILL_CODE & FE.CODE, 'C', NULL))) AS GRADE,
    ID, EMAIL
FROM DEVELOPERS, PY, CP, FE
HAVING GRADE IS NOT NULL
ORDER BY GRADE, ID;