-- team/project

CONNECT team/project

DROP TABLE Travel;
DROP TABLE ect;

CREATE TABLE Travel (
    T_package varchar(30) NOT NULL,
    sea varchar(20),
    tname varchar(20),
    T_start DATE,
    T_end DATE,
    period int,
    airline varchar(20),
    price int
 );
 
CREATE TABLE ect(
	tname varchar(20),
	vname varchar(20),
	exc varchar(50),
	hotel varchar(50)
);

SELECT * FROM Travel;
SELECT * FROM ECT;

-- 해외 패키지
insert into Travel values('패키지 여행', '해외', '하와이', to_date('2022-06-29','yyyy-mm-dd'), to_date('2022-07-05','yyyy-mm-dd'), 9, '대한항공', 5598000);
insert into Travel values('패키지 여행', '해외', '미국', to_date('2022-09-12','yyyy-mm-dd'), to_date('2022-09-21','yyyy-mm-dd'), 10, '아시아나항공', 7798000 );
insert into Travel values('패키지 여행', '해외', '터키', to_date('2022-07-15','yyyy-mm-dd'), to_date('2022-07-24','yyyy-mm-dd'), 10, '대한항공', 4002000  );
insert into Travel values('패키지 여행', '해외', '싱가포르', to_date('2022-06-16','yyyy-mm-dd'), to_date('2022-06-19','yyyy-mm-dd'), 4, '티웨이항공', 1738000 );
insert into Travel values('패키지 여행', '해외', '이탈리아', to_date('2022-09-17','yyyy-mm-dd'), to_date('2022-09-24','yyyy-mm-dd'), 8, '카타르항공', 3998000 );
insert into ect values('하와이', '오하우','민속촌 관람, 목장 일일 체험','와이키키 호텔');
insert into ect values('미국', 'LA', '유람선, 스타의 거리',null);
insert into ect values('터키', '터키','소금호수, 카파도키아',null);
insert into ect values('싱가포르','싱가포르','유니버셜 스튜디오','알렉산드라');
insert into ect values('이탈리아','루체른','콜로세움, 톨레도 대성당',null);

-- 국내 패키지
insert into Travel values('패키지 여행', '국내', '고창', to_date('2022-06-12','yyyy-mm-dd'), to_date('2022-06-12','yyyy-mm-dd'), 1, null, 55800 );
insert into Travel values('패키지 여행', '국내', '울릉도', to_date('2022-08-21','yyyy-mm-dd'), to_date('2022-08-23','yyyy-mm-dd'), 3, null, 810000 );
insert into Travel values('패키지 여행', '국내', '제주도', to_date('2022-08-09','yyyy-mm-dd'), to_date('2022-08-11','yyyy-mm-dd'), 3, '대한항공', 1118000 );
insert into Travel values('패키지 여행', '국내', '제주도', to_date('2022-09-17','yyyy-mm-dd'), to_date('2022-09-24','yyyy-mm-dd'), 8, '아시아나항공', 1999000 );
insert into Travel values('패키지 여행', '국내', '제주도', to_date('2022-07-03','yyyy-mm-dd'), to_date('2022-07-05','yyyy-mm-dd'), 3, '아시아나항공', 1098000 );
insert into ect values('고창','고창','꽃축제관람',null);
insert into ect values('울릉도','울릉도,독도','쾌속선 등',null);
insert into ect values('제주도','제주도','우도 등','히든클리프');
insert into ect values('제주도','제주도','마라도 등','해비지');
insert into ect values('제주도','제주도','한담산책로',null);

-- 해외 자유여행
insert into travel values('자유여행', '해외', '일본', TO_DATE ('05-07-2022','dd-mm-yyyy'), TO_DATE ('17-07-2022','dd-mm-yyyy'), 13, '진에어', 700600);
insert into travel values('자유여행', '해외', '태국', TO_DATE ('05-07-2022','dd-mm-yyyy'), TO_DATE ('17-07-2022','dd-mm-yyyy'), 13, '싱가폴항공', 1315600);
insert into travel values('자유여행', '해외', '베트남', TO_DATE ('01-07-2022','dd-mm-yyyy'), TO_DATE ('06-07-2022','dd-mm-yyyy'), 6, '비엣젯항공', 989400);
insert into travel values('자유여행', '해외', '파리', TO_DATE ('20-06-2022','dd-mm-yyyy'), TO_DATE ('24-07-2022','dd-mm-yyyy'), 35, '아시아나항공', 4396200);
insert into travel values('자유여행', '해외', '런던', TO_DATE ('22-06-2022','dd-mm-yyyy'), TO_DATE ('30-06-2022','dd-mm-yyyy'), 9, '에티오피아', 3365700);
insert into travel values('자유여행', '해외', '아테네', TO_DATE ('16-06-2022','dd-mm-yyyy'), TO_DATE ('25-06-2022','dd-mm-yyyy'), 10, '대한항공', 3842500);
insert into travel values('자유여행', '해외', '뉴욕', TO_DATE ('22-06-2022','dd-mm-yyyy'), TO_DATE ('30-06-2022','dd-mm-yyyy'), 9, '아시아나항공', 7543200);
insert into travel values('자유여행', '해외', '라스베가스', TO_DATE ('01-07-2022','dd-mm-yyyy'), TO_DATE ('06-07-2022','dd-mm-yyyy'), 6, '하와이안항공', 5238400);
INSERT INTO ect values('부산', '해운대', '밀면, 해운대', '아바니 센트럴 부산');
INSERT INTO ect values('경주', '교촌', '한옥마을, 동궁과 월지', '경주 스위트 호텔');

-- 국내 자유여행
insert into travel values('자유여행', '국내', '부산', TO_DATE('13-06-2022','dd-mm-yyyy'), TO_DATE('17-06-2022','dd-mm-yyyy'), 3, '에어부산', 363680);
insert into travel values('자유여행', '국내', '경주', TO_DATE('15-06-2022','dd-mm-yyyy'), TO_DATE('26-06-2022','dd-mm-yyyy'), 12, '티웨이항공', 186400);
INSERT INTO ect values('일본', '오사카', '유니버셜 스튜디오, 구로몬 시장', '몬토레 그라스미아 호텔');
INSERT INTO ect values('태국', '푸켓', '빠통 비치, 돌고래쇼', '빠통 베이 힐 리조트 푸켓');
INSERT INTO ect values('베트남', '다낭', '바나힐, 코코넛 커피', '힐튼 호텔');
INSERT INTO ect values('프랑스', '파리', '샹젤리제, 루브르 박물관', '호텔 르 월트');
INSERT INTO ect values('영국', '런던', '버킹엄궁전, 대영박물관', '굿 호텔 런던');
INSERT INTO ect values('그리스', '아테네', '신타그마 광장', '그랜드 하얏트 아테네');
INSERT INTO ect values('미국', '뉴욕', '타임스퀘어, 메트로폴리탄', '플라자 호텔 ');
INSERT INTO ect values('미국', '라스베가스', '카지노, 세븐매직마운틴스', '씨저스 팰리스');

COMMIT;

SELECT * FROM Travel;
SELECT * FROM ECT;



