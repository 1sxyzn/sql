SELECT H.HISTORY_ID, ROUND((DATEDIFF(H.END_DATE, H.START_DATE)+1) * C.DAILY_FEE * (100-IFNULL(D.DISCOUNT_RATE, 0)) / 100, 0) AS FEE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
LEFT JOIN CAR_RENTAL_COMPANY_CAR AS C
ON H.CAR_ID = C.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS D
ON C.CAR_TYPE = D.CAR_TYPE AND
    D.DURATION_TYPE = (
        CASE
            WHEN DATEDIFF(H.END_DATE, H.START_DATE)+1 >= 90
            THEN '90일 이상'
            WHEN DATEDIFF(H.END_DATE, H.START_DATE)+1 >= 30
            THEN '30일 이상'
            WHEN DATEDIFF(H.END_DATE, H.START_DATE)+1 >= 7
            THEN '7일 이상'
            ELSE NULL
        END
    )
WHERE C.CAR_TYPE = '트럭'
ORDER BY FEE DESC, H.HISTORY_ID DESC;
