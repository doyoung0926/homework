-- 1. 아래 2개의 테이블을 생성하고, 주어진 문제에 대한 sql문장을 작성하시오.
-- n 제출물: hw03.sql, hw03.ipynb 또는 hw03.py
-- n 데이터베이스 이름: shoppingmall
-- n 테이블 이름: user_table

# database 생성: shoppingmall
create database shoppingmall;

# shoppingmall database 선택
use shoppingmall;

# -----------------------------------------------------------------

# user_table 테이블 생성
create table user_table
	(userID char(8),  # 사용자 ID
	userName varchar(10) not null,  # 이름
	birthYear int not null,  # 출생년도
	addr char(2) not null,  # 지역(경기, 서울, 경남, 2글자)
	mobile1 char(3),  # 휴대폰 국번
	mobile2 char(8),  # 휴대폰 나머지 전화번호 (하이픈 제외)
	height smallint,  # 키
	mDate date, # 회원 가입일
	constraint pk_user primary key (userID)
	);

# user_table 테이블 확인
desc user_table;

# user_table 데이터 추가
insert into user_table (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate)
values ('KHD','강호동',1970,'경북','011','22222222',182,'2007-07-07'),
('KJD','김제동',1974,'경남',null,null,173,'2013-03-03'),
('KKJ','김국진',1965,'서울','019','33333333',171,'2009-09-09'),
('KYM','김용만',1967,'서울','010','44444444',177,'2015-05-05'),
('LHJ','이휘재',1972,'경기','011','88888888',180,'2006-04-04'),
('LKK','이경규',1960,'경남','018','99999999',170,'2004-12-12'),
('NHS','남희석',1971,'충남','016','66666666',180,'2017-04-04'),
('PSH','박수홍',1970,'서울','010','00000000',183,'2012-05-05'),
('SDY','신동엽',1971,'경기',null,null,176,'2008-10-10'),
('YJS','유재석',1972,'서울','010','11111111',178,'2008-08-08');

# user_table 데이터 확인
select * from user_table;

# --------------------------------------------------------------------

# buy_table 테이블 생성
create table buy_table
	(num int auto_increment, # 순번
	userID char(8) not null, # 아이디 (FK)
	prodName char(6) not null, # 물품명
	groupName char(4), # 분류
	price int not null, # 단가
	amount smallint not null, # 수량
	constraint pk_buy primary key (num),
	constraint fk_buy_user_id foreign key (userID)
	references user_table(userID)
);

# buy_table 테이블 확인
desc buy_table;

# buy_table 데이터 추가
insert into buy_table (num, userID, prodName, groupName, price, amount)
values (null,'KHD','운동화',null,30,2),
(null,'KHD','노트북','전자',1000,1),
(null,'KYM','모니터','전자',200,1),
(null,'PSH','모니터','전자',200,5),
(null,'KHD','청바지','의류',50,3),
(null,'PSH','메모리','전자',80,10),
(null,'KJD','책','서적',15,5),
(null,'LHJ','책','서적',15,2),
(null,'LHJ','청바지','의류',50,1),
(null,'PSH','운동화',null,30,2),
(null,'LHJ','책','서적',15,1),
(null,'PSH','운동화',null,30,2);

# buy_table 데이터 확인
select * from buy_table;

# ---------------------------------------------------------------------
-- 2. 두 테이블을 내부 조인(buy_table.useID와 user_table.userID)한 다음, 아래의 결과와 같이
-- 출력이 되도록 SQL 쿼리를 작성하시오.

-- 1) 내부 조인한 결과에 ‘연락처’ 컬럼 추가

select u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
from user_table as u inner join buy_table as b
	on u.userID = b.userID;


-- 2) userID가 KYM인 사람이 구매한 물건과 회원 정보 출력

select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1,u.mobile2)
from user_table as u inner join buy_table as b 
	on u.userID = b.userID
where u.userID ='KYM';

-- 3) 전체 회원이 구매한 목록을 회원 아이디 순으로 정렬

select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1,u.mobile2) as '연락'
from user_table as u inner join buy_table as b 
	on u.userID = b.userID
order by u.userID;
 
-- 4) 쇼핑몰에서 한 번이라도 구매한 기록이 있는 회원 정보를 회원 아이디 순으로 출력
-- (distinct 사용)

select distinct u.userID, u.userName, u.addr
from user_table as u inner join buy_table as b 
	on u.userID = b.userID
where b.amount >= 1
order by u.userID;

-- 5) 쇼핑몰 회원 중에서 주소가 경북과 경남인 회원 정보를 회원 아이디 순으로 출력

select u.userID, u.userName, u.addr, concat(u.mobile1, u.mobile2) as '연락'
from user_table as u inner join buy_table as b 
	on u.userID = b.userID
where u.addr in ('경북', '경남')
order by u.userID;
