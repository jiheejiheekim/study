-- 학급.학급번호 = 학생.학급번호가 같으면 하나로 합쳐 순서대로 가져와서 출력해라
SELECT C.SNUM, SNAME, SROOM, TEL, ADDR, INDATE
FROM SCLASS C JOIN STUDENT T
JOIN C.SUM = T.SNUM_FK;