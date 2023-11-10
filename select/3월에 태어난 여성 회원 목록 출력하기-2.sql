SELECT MEMBER_ID, MEMBER_NAME, GENDER, LEFT(DATE_OF_BIRTH,10) AS DATE_OF_BIRTH
FROM MEMBER_PROFILE 
WHERE GENDER='W' AND MONTH(DATE_OF_BIRTH)=03 AND TLNO IS NOT NULL
ORDER BY MEMBER_ID;
