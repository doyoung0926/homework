-- 1. sqlclass_db 데이터베이스에 제공된 nobel.csv파일을 import하여 각각 nobel 테이블을 생성
-- 하고 아래 내용에 대해 쿼리를 작성하시오.
--  제출물: hw02.sql
--  데이터베이스 이름: sqlclass_db
--  테이블 이름: nobel (1901년 ~ 1965년까지 노벨상 수상자 현황)

# sqlclass_db 데이터베이스 선택
use sqlclass_db;

# nobel 테이블 데이터 확인
select * from nobel;

-- 1) 1960년에 노벨상 물리학상 또는 노벨 평화상을 수상한 사람의 정보를 출력
-- - 출력 컬럼: year, subject, winner

select year, subject, winner
from nobel
where year=1960
and (subject='Physics' or subject='Peace');

-- 2) Albert Einstein이 수상한 연도와 상 이름을 출력
-- - 출력 컬럼: year, subject

select year, subject
from nobel
where winner='Albert Einstein';

-- 3) 1910년 부터 1950년까지 노벨 평화상 수상자 명단 출력
-- - 출력 컬럼: year, winner

select year, winner
from nobel
where (year between 1910 and 1950)
and subject='Peace';

-- 4) 전체 테이블에서 수상자 이름이 ‘John’으로 시작하는 수상자 모두 출력
-- - 출력 컬럼: subject, winner

select subject, winner
from nobel
where winner like 'John%';

-- 5) 1964년 수상자 중에서 노벨화학상과 의학상을 제외한 수상자의 모든 정보를 수상자
-- 이름을 기준으로 오름차순으로 정렬 후 출력

select year, subject, winner
from nobel
where year = 1964
and subject not in ('Chemistry', 'Medicine')
order by winner asc;

-- 6) 1910년부터 1960년까지 노벨 문학상 수상자 명단 출력

select winner
from nobel
where (year between 1910 and 1960)
and subject='Literature';

-- 7) 각 분야별 역대 수상자의 수를 내림차순으로 정렬 후 출력(group by, order by)
 
select subject, count(*)
from nobel
group by subject
order by count(*) desc;

-- 8) 노벨 의학상이 없었던 연도를 모두 출력 (distinct) 사용

select distinct year
from nobel
where year not in (select year from nobel where subject = 'Medicine');

-- 9) 노벨 의학상이 없었던 연도의 총 회수를 출력

select count(distinct year) as year_count
from nobel
where year not in (select year from nobel where subject = 'Medicine');
