/*
 * DDL 개념과 역할
 * DDL (Data Definition Language)
 * DDL은 데이터베이스의 구조를 정의하는 언어이다.
 * 주요 명령어로는 create, alter, drop, truncate 등이 있으며
 * 테이블 및 데이터베이스의 스키마를 정의하고 관리하는 역할을 한다.
 * */

-- 현재 사용하는 데이터베이스에 모든 테이블을 조회한다.
SHOW tables;


/*
 * 테이블 생성
 * */
CREATE TABLE course_reviews (
	review_id int AUTO_INCREMENT PRIMARY KEY comment "리뷰 ID(고유 식별자)",
	user_id int NOT NULL comment "리뷰 작성 학생 ID(외래키)",
	course_id int NOT NULL comment "리뷰가 작생된 강좌 ID(외래키)",
	rating int NOT NULL CHECK (rating BETWEEN 1 AND 5) comment "평점 (1~5점)",
	review_text text comment "리뷰 내용(선택사항)",
	create_at timestamp DEFAULT current_timestamp comment "작성 날짜",
	FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
	FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

SELECT * FROM course_reviews;


-- 테이블 수정하기
ALTER TABLE course_reviews
ADD COLUMN updated_at timestamp NULL ON UPDATE current_timestamp comment "리뷰 수정 날짜";


SELECT * FROM course_reviews;


-- 컬럼 삭제
ALTER TABLE course_reviews
DROP COLUMN review_text;

SELECT * FROM course_reviews;


-- 제약조건 적용
ALTER TABLE course_reviews
ADD CONSTRAINT chk_ration CHECK (rating BETWEEN 1 AND 10);


-- TRUNCATE TALBE
truncate TABLE course_reviews;

SELECT * FROM course_reviews;


-- drop table
DROP TABLE course_reviews;

SHOW tables;
