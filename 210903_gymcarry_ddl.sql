
CREATE TABLE `member` (
  `MEMIDX` int NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `JOINKEY_STATUS` int DEFAULT NULL COMMENT '인증키 여부',
  `JOINKEY` int DEFAULT NULL COMMENT '인증키 저장',
  `MEMEMAIL` varchar(40) NOT NULL COMMENT '이메일',
  `MEMPW` varchar(30) NOT NULL COMMENT '비밀번호',
  `MEMNAME` varchar(50) NOT NULL COMMENT '이름',
  `MEMNICK` varchar(50) NOT NULL COMMENT '닉네임',
  `MEMPHONE` varchar(50) NOT NULL COMMENT '핸드폰번호',
  `MEMBIRTH` int NOT NULL COMMENT '생년월일',
  `MEMGENDER` varchar(5) NOT NULL COMMENT '성별',
  `MEMPHOTO` varchar(30) DEFAULT NULL COMMENT '회원사진',
  PRIMARY KEY (`MEMIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원';


CREATE TABLE `MEMBERBODYINFO` (
  `MEMO` mediumtext COMMENT '타입',
  `MEMDATE` timestamp NULL DEFAULT NULL COMMENT '날짜',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  KEY `FK_MEMBER_TO_MEMBERBODYINFO` (`MEMIDX`),
  CONSTRAINT `FK_MEMBER_TO_MEMBERBODYINFO` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원바디기록';



CREATE TABLE `BOARD` (
  `POSTIDX` int NOT NULL AUTO_INCREMENT COMMENT '게시글IDX',
  `POSTNAME` varchar(255) NOT NULL COMMENT '제목',
  `POSTCONTENT` mediumtext NOT NULL COMMENT '글내용',
  `POSTNICK` varchar(50) NOT NULL COMMENT '닉네임',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  `UPLOADFILE` mediumblob COMMENT '첨부파일',
  `POSTDATE` timestamp NOT NULL COMMENT '작성일자',
  `POSTVIEW` int NOT NULL COMMENT '조회수',
  `POSTLIKE` int DEFAULT NULL COMMENT '좋아요갯수',
  `BOARDCATEGORY` varchar(50) NOT NULL COMMENT '말머리',
  PRIMARY KEY (`POSTIDX`),
  KEY `FK_MEMBER_TO_BOARD` (`MEMIDX`),
  CONSTRAINT `FK_MEMBER_TO_BOARD` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';


CREATE TABLE `BOARDCOMMENT` (
  `COMMENTIDX` int NOT NULL AUTO_INCREMENT COMMENT '댓글IDX',
  `POSTIDX` int NOT NULL COMMENT '게시글IDX',
  `COMMENTNICK` varchar(50) NOT NULL COMMENT '닉네임',
  `COMMENTCONTENT` mediumtext NOT NULL COMMENT '댓글내용',
  `COMMENTDATE` timestamp NOT NULL COMMENT '댓글작성일자',
  PRIMARY KEY (`COMMENTIDX`),
  KEY `FK_BOARD_TO_BOARDCOMMENT` (`POSTIDX`),
  CONSTRAINT `FK_BOARD_TO_BOARDCOMMENT` FOREIGN KEY (`POSTIDX`) REFERENCES `BOARD` (`POSTIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판댓글';


CREATE TABLE `PLACE` (
  `PLACENUM` int NOT NULL COMMENT '운동구분',
  `PLACEIDX` int NOT NULL AUTO_INCREMENT COMMENT '플레이스IDX',
  `PLACENAME` varchar(50) NOT NULL COMMENT '업체명',
  `PLACEADDRESS` mediumtext NOT NULL COMMENT '업체주소',
  `LATITUDE` float NOT NULL COMMENT '위도',
  `LONGITUDE` float NOT NULL COMMENT '경도',
  `PLACEPHONE` varchar(50) NOT NULL COMMENT '업체전화번호',
  `PLACEINFO` text NOT NULL COMMENT '이용정보',
  `PLACEINTRO` text NOT NULL COMMENT '업체소개',
  `OPENHOUR` text NOT NULL COMMENT '영업시간',
  `PLACEIMG` text NOT NULL COMMENT '이미지',
  PRIMARY KEY (`PLACEIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='플레이스';
/*!40101 SET character_set_client = @saved_cs_client */;



CREATE TABLE `carry` (
  `CRIDX` int NOT NULL AUTO_INCREMENT COMMENT '캐리IDX',
  `JOINKEY_STATUS` int COMMENT '인증키 여부',
  `JOINKEY` int COMMENT '인증키 저장',
  `CRPHOTO` varchar(30) DEFAULT 'photo.png' COMMENT '캐리사진',
  `CRBFPHOTO` varchar(30) DEFAULT 'photo.png' COMMENT '캐리 바디프로필 사진',
  `CREMAIL` varchar(30) NOT NULL COMMENT '캐리아이디',
  `CRPW` varchar(30) NOT NULL COMMENT '비밀번호',
  `CRNAME` varchar(50) DEFAULT NULL COMMENT '캐리실명',
  `CRNICK` varchar(50) DEFAULT NULL COMMENT '캐리닉네임',
  `CRGENDER` varchar(5) DEFAULT NULL COMMENT '성별',
  `CRPHONE` varchar(50) DEFAULT NULL COMMENT '캐리연락처',
  `CRINTRO` text COMMENT '소갯말',
  `CRDEPART` varchar(10) DEFAULT NULL COMMENT '전문분야',
  `CRFIELD` varchar(10) DEFAULT NULL COMMENT '종목',
  `FACEORNOT` tinyint(1) DEFAULT NULL COMMENT '비대면&대면',
  `PLACEIDX` int DEFAULT NULL COMMENT '플레이스IDX',
  PRIMARY KEY (`CRIDX`),
  KEY `FK_PLACE_TO_CARRY` (`PLACEIDX`),
  CONSTRAINT `FK_PLACE_TO_CARRY` FOREIGN KEY (`PLACEIDX`) REFERENCES `place` (`PLACEIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='캐리정보';



CREATE TABLE `crcertification` (
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `CRCERTI1` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '자격및경력1',
  `CRCERTI2` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '자격및경력1',
  `CRCERTI3` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '자격및경력1',
  `CRCERTI4` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '자격및경력1',
  `CRCERTI5` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '자격및경력1',
  KEY `FK_CARRY_TO_CRCERTIFICATION` (`CRIDX`),
  CONSTRAINT `FK_CARRY_TO_CRCERTIFICATION` FOREIGN KEY (`CRIDX`) REFERENCES `carry` (`CRIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;


CREATE TABLE `crprice` (
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `PROCOUNT` int DEFAULT NULL COMMENT '수업 횟수',
  `PROPRICE` int DEFAULT NULL COMMENT '횟수당 가격',
  KEY `FK_CARRY_TO_CRPROGRAM` (`CRIDX`),
  CONSTRAINT `FK_CARRY_TO_CRPROGRAM` FOREIGN KEY (`CRIDX`) REFERENCES `carry` (`CRIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;




CREATE TABLE `review` (
  `REVIEWIDX` int NOT NULL AUTO_INCREMENT COMMENT '리뷰IDX',
  `REVIEWDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일자',
  `REVIEWCONTENT` mediumtext COMMENT '리뷰내용',
  `CRIDX` int DEFAULT NULL COMMENT '캐리IDX',
  `MEMIDX` int DEFAULT NULL COMMENT '회원번호',
  PRIMARY KEY (`REVIEWIDX`),
  KEY `FK_CARRY_TO_CARRYREVIEW` (`CRIDX`),
  KEY `FK_MEMBER_TO_CARRYREVIEW` (`MEMIDX`),
  CONSTRAINT `FK_CARRY_TO_CARRYREVIEW` FOREIGN KEY (`CRIDX`) REFERENCES `carry` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_CARRYREVIEW` FOREIGN KEY (`MEMIDX`) REFERENCES `member` (`MEMIDX`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='캐리상세페이지 리뷰댓글';



CREATE TABLE `CHATLIST` (
  `CHATIDX` int NOT NULL auto_increment COMMENT '채팅방번호',
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  PRIMARY KEY (`CHATIDX`),
  KEY `FK_CARRY_TO_CHATLIST` (`CRIDX`),
  KEY `FK_MEMBER_TO_CHATLIST` (`MEMIDX`),
  CONSTRAINT `FK_CARRY_TO_CHATLIST` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_CHATLIST` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
);



CREATE TABLE `CHATROOM` (
  `MESSAGEIDX` int NOT NULL AUTO_INCREMENT COMMENT '메세지 번호',
  `CHATIDX` int NOT NULL COMMENT '채팅방번호',
  `CHATCONTENT` mediumtext NOT NULL COMMENT '대화내용',
  `CHATDATE` timestamp NOT NULL COMMENT '대화시간',
  `CRIDX` int NOT NULL COMMENT '캐리번호',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  `CHATPOSITION` INT DEFAULT 0 COMMENT '0=방에서 안나감, 1=방에서나감',
  `CHATREAD` INT DEFAULT 0 COMMENT '0=읽지않음, 1=읽음',
  PRIMARY KEY (`MESSAGEIDX`),
  KEY `FK_CARRY_TO_CHATROOM` (`CRIDX`),
  KEY `FK_MEMBER_TO_CHATROOM` (`MEMIDX`),
  KEY `FK_CHATLIST_TO_CHATROOM` (`CHATIDX`),
  CONSTRAINT `FK_CARRY_TO_CHATROOM` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_CHATLIST_TO_CHATROOM` FOREIGN KEY (`CHATIDX`) REFERENCES `CHATLIST` (`CHATIDX`),
  CONSTRAINT `FK_MEMBER_TO_CHATROOM` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
);


CREATE TABLE `LIKELIST` (
  `LIKEIDX` int NOT NULL AUTO_INCREMENT COMMENT '좋아요IDX',
  `MEMIDX` int DEFAULT NULL COMMENT '회원번호',
  `CRIDX` int DEFAULT NULL COMMENT '캐리IDX',
  `LIKECHECK` tinyint(1) DEFAULT NULL COMMENT '좋아요체크',
  PRIMARY KEY (`LIKEIDX`),
  KEY `FK_MEMBER_TO_LIKELIST` (`MEMIDX`),
  KEY `FK_CARRY_TO_LIKELIST` (`CRIDX`),
  CONSTRAINT `FK_CARRY_TO_LIKELIST` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_LIKELIST` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='찜한리스트';




CREATE TABLE `PAYMENT` (
  `PAYIDX` int NOT NULL AUTO_INCREMENT COMMENT '결제번호',
  `PAYDATE` timestamp NOT NULL COMMENT '결제날짜',
  `MEMIDX` int NOT NULL COMMENT '회원번호',
  `PAYNAME` varchar(10) NOT NULL COMMENT '결제자명',
  `PAYPHONE` varchar(20) NOT NULL COMMENT '결제자연락처',
  `CRIDX` int DEFAULT NULL COMMENT '캐리IDX',
  `PAYPRICE` int NOT NULL COMMENT '결제금액',
  `PAYNUM` int NOT NULL COMMENT '결제한 수업횟수',
  `FACEORNOT` tinyint(1) DEFAULT NULL COMMENT '비대면&대면',
  PRIMARY KEY (`PAYIDX`),
  KEY `FK_MEMBER_TO_PAYMENT` (`MEMIDX`),
  KEY `FK_CARRY_TO_LIKELIST` (`CRIDX`),
  CONSTRAINT `FK_MEMBER_TO_PAYMENT` FOREIGN KEY (`MEMIDX`) REFERENCES `MEMBER` (`MEMIDX`),
  CONSTRAINT `FK_CARRY_TO_PAYMENT` FOREIGN KEY (`CRIDX`) REFERENCES `CARRY` (`CRIDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='결제';


