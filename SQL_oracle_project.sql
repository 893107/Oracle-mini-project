-- oracle을 이용한 여행상품 찾기 project

-- team/project
SELECT * FROM Travel;
SELECT * FROM ECT;


-- 1. 모든 상품 중, 관광지가 해외인 상품만 검색
SELECT * FROM Travel WHERE sea = '해외';


-- 2. 모든 상품 중, 관광지가 국내인 상품만 검색
SELECT * FROM travel WHERE sea = '국내';


-- 3. 국내 여행 상품 중, 출발일이 빠른 순으로 정렬
SELECT * FROM travel WHERE sea = '국내';
SELECT * FROM travel WHERE sea = '국내' ORDER BY T_START asc;


-- 4. 전체 상품을 낮은 가격 순으로 정렬한 뒤 출발일이 빠른 순으로 출력
SELECT * FROM Travel ORDER BY price ASC, T_START ASC;


-- 5. 국내여행 중 가격이 저렴한 순
SELECT * FROM travel WHERE sea = '국내';
SELECT * FROM travel WHERE sea = '국내' ORDER BY PRICE asc;


-- 6. 관광지가 제주도인 상품들의 항공사 정보 보기
SELECT TNAME, AIRLINE FROM Travel WHERE TNAME = '제주도';

-- 6-1. 프로시저를 이용하여 특정 관광지와 관련된 상품들의 항공사 정보 출력
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE NAMESEARCH(categoryname Travel.TNAME%TYPE)
IS 
	information Travel%rowtype;
CURSOR
	name 
is
	SELECT * FROM Travel WHERE TNAME = categoryname;	
BEGIN	
	OPEN name;	
loop
	FETCH name INTO information;
	EXIT WHEN name%NOTFOUND;
	dbms_output.put_line('관광지 명 : ' || categoryname || ', 상품 분류 : ' || information.T_PACKAGE ||', 항공사 : ' || information.AIRLINE);
END LOOP;

CLOSE name;
END;
/

CALL NAMESEARCH('제주도');

-- 6-2. 입력한 여행지와 관련된 상품들의 항공사 정보 출력
SET SERVEROUTPUT ON;
DECLARE	
	information Travel%rowtype;
	categoryname Travel.TNAME%TYPE := :a;
CURSOR
	name 
IS 
	SELECT * FROM Travel WHERE TNAME = categoryname;	
BEGIN	
	OPEN name;	
loop
	FETCH name INTO information;
	EXIT WHEN name%NOTFOUND;
	dbms_output.put_line('관광지 명 : ' || categoryname || ', 상품 분류 : ' || information.T_PACKAGE ||', 항공사 : ' || information.AIRLINE);
END LOOP;

CLOSE name;
END;
/


-- 7.  여행 기간이 7일 이상 ~ 12일 이하인 자유여행 상품을 찾고, 모든 정보 출력
SELECT * FROM Travel WHERE PERIOD BETWEEN 7 AND 12 ORDER BY PERIOD ASC; -- 자유여행 4개 확인
SELECT * FROM Travel WHERE T_PACKAGE = '자유여행' AND PERIOD BETWEEN 7 AND 12 ORDER BY PERIOD ASC;


-- 8. 6월 20일 ~ 8월 30일 이내에 여행하는 상품 찾기
SELECT * FROM Travel WHERE T_START BETWEEN '2022-06-20' AND '2022-08-30' ORDER BY T_START asc;


-- 9. 22년 6월 15일 이후에 출발하며 여행기간이 2일 이상, 7일 이하인 상품 검색

SELECT * FROM travel WHERE sea = '국내';
SELECT * FROM travel WHERE sea = '국내' AND T_START > to_date('15-06-2022', 'dd-mm-yyyy');
SELECT * FROM travel WHERE sea = '국내' AND T_START > to_date('15-06-2022', 'dd-mm-yyyy') AND period BETWEEN 2 AND 7;


-- 10. 호텔 일정이 확정된 상품만 검색
SELECT * FROM ect;
SELECT * FROM travel;
select e.tname, vname, exc, hotel 
from travel t, ect e 
where t.tname = e.tname and e.hotel is not null;

-- 10-2. 호텔 일정이 확정된 국내 상품만 검색
SELECT * FROM ect;
SELECT * FROM travel;
SELECT tname FROM travel WHERE sea = '국내';
select e.tname, vname, exc, hotel 
from travel t, ect e 
where t.tname = e.tname and t.sea = '국내' and e.hotel is not null;


-- 11. 여행 분류 별 모든 상품 검색 (패키지 여행/자유여행)
SET SERVEROUTPUT ON;
DECLARE	
	information Travel%rowtype;
	categoryname Travel.T_PACKAGE%TYPE := :a;
CURSOR
	name 
IS 
	SELECT * FROM Travel WHERE T_PACKAGE = categoryname;	
BEGIN	
	OPEN name;	
loop
	FETCH name INTO information;
	EXIT WHEN name%NOTFOUND;
	dbms_output.put_line('상품 분류 : ' || categoryname || ', 관광지 명 : ' || information.TNAME ||', 출발일 : ' || information.T_START || ', 도착일 : ' || information.T_END || ', 가격 : ' || information.PRICE);
END LOOP;

CLOSE name;
END;
/

-- 12. 여행지를 입력받아 국내/해외, 여행지, 가격을 출력
DECLARE
	v_row Travel%rowtype;
	v_tname Travel.TNAME%TYPE := &v;
BEGIN
	SELECT *
		INTO v_row
	FROM Travel
	WHERE TNAME = '제주도';
	dbms_output.put_line(v_row.sea || ' ' || v_row.TNAME || ' ' || v_row.price);
END;
/


