/* 글 */
DROP TABLE tbl_board 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE tbl_reply 
	CASCADE CONSTRAINTS;

/* 회원 */
DROP TABLE tbl_member 
	CASCADE CONSTRAINTS;

/* 파일 */
DROP TABLE tbl_file 
	CASCADE CONSTRAINTS;

/* 시퀀스 */
DROP SEQUENCE seq_board;
CREATE SEQUENCE seq_board;
DROP SEQUENCE seq_reply;
CREATE SEQUENCE seq_reply;

/* 글 */
CREATE TABLE tbl_board (
	BNO NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(150) NOT NULL, /* 제목 */
	CONTENT CLOB NOT NULL, /* 본문 */
	WRITE_DATE DATE DEFAULT SYSDATE NOT NULL, /* 작성일 */
	MODIFY_DATE DATE DEFAULT SYSDATE, /* 수정일 */
	VIEW_CNT NUMBER DEFAULT 0, /* 조회수 */
	LIKE_CNT NUMBER DEFAULT 0, /* 추천수 */
	HATE_CNT NUMBER DEFAULT 0, /* 비추천수 */
	RPL_CNT NUMBER DEFAULT 0, /* 댓글수 */
	WRITER VARCHAR2(90) NOT NULL /* 작성자 */
);

COMMENT ON TABLE tbl_board IS '글';

COMMENT ON COLUMN tbl_board.BNO IS '글번호';

COMMENT ON COLUMN tbl_board.TITLE IS '제목';

COMMENT ON COLUMN tbl_board.CONTENT IS '본문';

COMMENT ON COLUMN tbl_board.WRITE_DATE IS '작성일';

COMMENT ON COLUMN tbl_board.MODIFY_DATE IS '수정일';

COMMENT ON COLUMN tbl_board.VIEW_CNT IS '조회수';

COMMENT ON COLUMN tbl_board.LIKE_CNT IS '추천수';

COMMENT ON COLUMN tbl_board.HATE_CNT IS '비추천수';

COMMENT ON COLUMN tbl_board.RPL_CNT IS '댓글수';

COMMENT ON COLUMN tbl_board.WRITER IS '작성자';

CREATE UNIQUE INDEX PK_tbl_board
	ON tbl_board (
		BNO ASC
	);

ALTER TABLE tbl_board
	ADD
		CONSTRAINT PK_tbl_board
		PRIMARY KEY (
			BNO
		);

/* 댓글 */
CREATE TABLE tbl_reply (
	RNO NUMBER NOT NULL, /* 댓글번호 */
	BNO NUMBER NOT NULL, /* 글번호 */
	RPL_CONTENT VARCHAR2(1500) NOT NULL, /* 댓글내용 */
	WRITER VARCHAR2(90) NOT NULL, /* 댓글작성자 */
	RPL_DATE DATE DEFAULT SYSDATE, /* 댓글작성일 */
	RPL_MODIFY DATE DEFAULT SYSDATE, /* 댓글수정일 */
	RPL_LIKE NUMBER DEFAULT 0, /* 댓글추천수 */
	RPL_HATE NUMBER DEFAULT 0 /* 댓글비추천수 */
);

COMMENT ON TABLE tbl_reply IS '댓글';

COMMENT ON COLUMN tbl_reply.RNO IS '댓글번호';

COMMENT ON COLUMN tbl_reply.BNO IS '글번호';

COMMENT ON COLUMN tbl_reply.RPL_CONTENT IS '댓글내용';

COMMENT ON COLUMN tbl_reply.WRITER IS '댓글작성자';

COMMENT ON COLUMN tbl_reply.RPL_DATE IS '댓글작성일';

COMMENT ON COLUMN tbl_reply.RPL_MODIFY IS '댓글수정일';

COMMENT ON COLUMN tbl_reply.RPL_LIKE IS '댓글추천수';

COMMENT ON COLUMN tbl_reply.RPL_HATE IS '댓글비추천수';

CREATE UNIQUE INDEX PK_tbl_reply
	ON tbl_reply (
		RNO ASC
	);

ALTER TABLE tbl_reply
	ADD
		CONSTRAINT PK_tbl_reply
		PRIMARY KEY (
			RNO
		);

/* 회원 */
CREATE TABLE tbl_member (
	EMAIL VARCHAR2(90) NOT NULL, /* 이메일 */
	NICKNAME VARCHAR2(30) NOT NULL, /* 닉네임 */
	PASSWORD VARCHAR2(50) NOT NULL, /* 비밀번호 */
	REG_DATE DATE DEFAULT SYSDATE NOT NULL /* 가입일 */
);

COMMENT ON TABLE tbl_member IS '회원';

COMMENT ON COLUMN tbl_member.EMAIL IS '이메일';

COMMENT ON COLUMN tbl_member.NICKNAME IS '닉네임';

COMMENT ON COLUMN tbl_member.PASSWORD IS '비밀번호';

COMMENT ON COLUMN tbl_member.REG_DATE IS '가입일';

CREATE UNIQUE INDEX PK_tbl_member
	ON tbl_member (
		EMAIL ASC
	);

ALTER TABLE tbl_member
	ADD
		CONSTRAINT PK_tbl_member
		PRIMARY KEY (
			EMAIL
		);

/* 파일 */
CREATE TABLE tbl_file (
	UUID VARCHAR2(100) NOT NULL, /* UUID */
	UPLOAD_PATH VARCHAR2(200) NOT NULL, /* 업로드 경로 */
	FILE_NAME VARCHAR2(100) NOT NULL, /* 파일이름 */
	FILE_TYPE CHAR(1) NOT NULL, /* 파일타입 */
	BNO NUMBER NOT NULL /* 글번호 */
);

COMMENT ON TABLE tbl_file IS '파일';

COMMENT ON COLUMN tbl_file.UUID IS 'UUID';

COMMENT ON COLUMN tbl_file.UPLOAD_PATH IS '업로드 경로';

COMMENT ON COLUMN tbl_file.FILE_NAME IS '파일이름';

COMMENT ON COLUMN tbl_file.FILE_TYPE IS '파일타입';

COMMENT ON COLUMN tbl_file.BNO IS '글번호';

CREATE UNIQUE INDEX PK_tbl_file
	ON tbl_file (
		UUID ASC
	);

ALTER TABLE tbl_file
	ADD
		CONSTRAINT PK_tbl_file
		PRIMARY KEY (
			UUID
		);

ALTER TABLE tbl_board
	ADD
		CONSTRAINT FK_tbl_member_TO_tbl_board
		FOREIGN KEY (
			WRITER
		)
		REFERENCES tbl_member (
			EMAIL
		);

ALTER TABLE tbl_reply
	ADD
		CONSTRAINT FK_tbl_board_TO_tbl_reply
		FOREIGN KEY (
			BNO
		)
		REFERENCES tbl_board (
			BNO
		);

ALTER TABLE tbl_reply
	ADD
		CONSTRAINT FK_tbl_member_TO_tbl_reply
		FOREIGN KEY (
			WRITER
		)
		REFERENCES tbl_member (
			EMAIL
		);

ALTER TABLE tbl_file
	ADD
		CONSTRAINT FK_tbl_board_TO_tbl_file
		FOREIGN KEY (
			BNO
		)
		REFERENCES tbl_board (
			BNO
		);