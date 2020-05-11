
/* Drop Tables */

DROP TABLE order_product CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE sale CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE common CASCADE CONSTRAINTS;
DROP TABLE refund_history CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE point_history CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE cart
(
	cartnum number NOT NULL,
	id varchar2(25) NOT NULL,
	pnum number NOT NULL,
	EA number NOT NULL,
	PRIMARY KEY (cartnum)
);


CREATE TABLE category
(
	cnum number NOT NULL,
	type number,
	name varchar2(30),
	PRIMARY KEY (cnum)
);


CREATE TABLE common
(
	type varchar2(40) UNIQUE,
	conum number,
	name varchar2(50)
);


CREATE TABLE member
(
	num number NOT NULL,
	id varchar2(25),
	pwd varchar2(25),
	name varchar2(30),
	rating number,
	email varchar2(40),
	birth varchar2(30),
	phone varchar2(30),
	-- 1:남자
	-- 2:여자
	gender number,
	addr varchar2(50),
	reg_date date,
	-- y:삭제
	-- n:미삭제
	del_yn char,
	del_date date,
	point number,
	PRIMARY KEY (num)
);


CREATE TABLE orders
(
	onum number NOT NULL,
	opnum number,
	-- 1:상품 준비
	-- 2:배송 준비
	-- 3:배송 중
	-- 4:배송 완료
	-- 5:구매 완료
	-- 6:주문 취소
	status number,
	-- 1:미결제
	-- 2:결제
	pay_yn number,
	reg_date date,
	end_date date,
	id varchar2(25),
	price number,
	num number NOT NULL,
	use_point number,
	sale_price number,
	-- 카드 결제
	-- 무통장
	pay_way number,
	PRIMARY KEY (onum)
);


CREATE TABLE order_product
(
	opnum number NOT NULL,
	pnum number,
	pname varchar2(30),
	EA number,
	price number,
	onum number NOT NULL,
	pnum number NOT NULL,
	PRIMARY KEY (opnum)
);


CREATE TABLE point_history
(
	ponum number NOT NULL,
	id varchar2(35),
	use_vol number,
	reg_date date,
	del_yn char,
	num number NOT NULL,
	PRIMARY KEY (ponum)
);


CREATE TABLE product
(
	pnum number NOT NULL,
	cnum number NOT NULL,
	cartnum number NOT NULL,
	cnum number,
	type number,
	name varchar2(40),
	reg_date date,
	del_yn char,
	price number,
	stock number,
	type number,
	orgimg varchar2(50),
	saveimg varchar2(50),
	PRIMARY KEY (pnum)
);


CREATE TABLE qna
(
	pnum number,
	rnum number,
	num number,
	id varchar2(40),
	name varchar2(40),
	title varchar2(50),
	content varchar2(100),
	ref number,
	lev number,
	step number,
	regdate date,
	del_yn char,
	pnum number NOT NULL,
	num number NOT NULL,
	CONSTRAINT primary UNIQUE (pnum, rnum)
);


CREATE TABLE refund_history
(
	num number,
	onum number,
	reason varchar2(100),
	reg_date date,
	num number NOT NULL,
	onum number NOT NULL,
	UNIQUE (num, onum)
);


CREATE TABLE review
(
	pnum number,
	rnum number,
	num number,
	id varchar2(40),
	name varchar2(40),
	title varchar2(50),
	content varchar2(100),
	regdate date,
	del_yn char,
	pnum number NOT NULL,
	onum number NOT NULL,
	pwd varchar2(40),
	num number NOT NULL,
	CONSTRAINT primary UNIQUE (pnum, rnum)
);


CREATE TABLE sale
(
	snum number NOT NULL,
	pnum number NOT NULL,
	pnum number,
	percent number,
	start_date date,
	end_date date,
	del_yn char,
	PRIMARY KEY (snum)
);



/* Create Foreign Keys */

ALTER TABLE product
	ADD FOREIGN KEY (cartnum)
	REFERENCES cart (cartnum)
;


ALTER TABLE product
	ADD FOREIGN KEY (cnum)
	REFERENCES category (cnum)
;


ALTER TABLE orders
	ADD FOREIGN KEY (num)
	REFERENCES member (num)
;


ALTER TABLE point_history
	ADD FOREIGN KEY (num)
	REFERENCES member (num)
;


ALTER TABLE qna
	ADD FOREIGN KEY (num)
	REFERENCES member (num)
;


ALTER TABLE refund_history
	ADD FOREIGN KEY (num)
	REFERENCES member (num)
;


ALTER TABLE review
	ADD FOREIGN KEY (num)
	REFERENCES member (num)
;


ALTER TABLE order_product
	ADD FOREIGN KEY (onum)
	REFERENCES orders (onum)
;


ALTER TABLE refund_history
	ADD FOREIGN KEY (onum)
	REFERENCES orders (onum)
;


ALTER TABLE review
	ADD FOREIGN KEY (onum)
	REFERENCES orders (onum)
;


ALTER TABLE order_product
	ADD FOREIGN KEY (pnum)
	REFERENCES product (pnum)
;


ALTER TABLE qna
	ADD FOREIGN KEY (pnum)
	REFERENCES product (pnum)
;


ALTER TABLE review
	ADD FOREIGN KEY (pnum)
	REFERENCES product (pnum)
;


ALTER TABLE sale
	ADD FOREIGN KEY (pnum)
	REFERENCES product (pnum)
;



/* Comments */

COMMENT ON COLUMN member.gender IS '1:남자
2:여자';
COMMENT ON COLUMN member.del_yn IS 'y:삭제
n:미삭제';
COMMENT ON COLUMN orders.status IS '1:상품 준비
2:배송 준비
3:배송 중
4:배송 완료
5:구매 완료
6:주문 취소';
COMMENT ON COLUMN orders.pay_yn IS '1:미결제
2:결제';
COMMENT ON COLUMN orders.pay_way IS '카드 결제
무통장';



