SELECT AI.ANIMAL_ID, AI.NAME
FROM ANIMAL_INS AS AI JOIN ANIMAL_OUTS AS AO
ON AI.ANIMAL_ID=AO.ANIMAL_ID
WHERE AI.DATETIME>AO.DATETIME
ORDER BY AI.DATETIME;
