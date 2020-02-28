CREATE DATABASE IF NOT EXISTS Easyui;

USE Easyui;

CREATE TABLE tb_admin(
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL,
	gender VARCHAR(12) DEFAULT NULL,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(32) NOT NULL,
	phone VARCHAR(32),
	address VARCHAR(256) NOT NULL,
	no VARCHAR(32) NOT NULL,
	clazzname VARCHAR(32),
	PRIMARY KEY(id)
)

INSERT INTO tb_admin VALUES(1,"admin0","male","admin0","0@qq.com","13000000000","广州","A9527",null);


CREATE TABLE tb_student(
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL,
	gender VARCHAR(12) DEFAULT NULL,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(32) NOT NULL,
	phone VARCHAR(32),
	address VARCHAR(256) NOT NULL,
	stu_id VARCHAR(11) NOT NULL,
	classname VARCHAR(32) NOT NULL,
	about VARCHAR(256) NOT NULL,
	PRIMARY KEY(id)
)

INSERT INTO tb_student VALUES(1,"student0","male","student0","1@qq.com","13000000000","广州","S9527","17网络1班","无");


CREATE TABLE tb_teacher(
	id INT(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(32) NOT NULL,
	gender VARCHAR(12) DEFAULT NULL,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(32) NOT NULL,
	phone VARCHAR(32),
	address VARCHAR(256) NOT NULL,
	tea_id VARCHAR(11) NOT NULL,
	classname VARCHAR(32) NOT NULL,
	PRIMARY KEY(id)
)

INSERT INTO tb_teacher VALUES(1,"teacher0","male","teacher0","2@qq.com","13000000000","广州","T9527","17网络1班");


CREATE TABLE tb_class(
		id INT(11) NOT NULL AUTO_INCREMENT,
		no VARCHAR(11) NOT NULL,
		name VARCHAR(32) NOT NULL,
		class_teacher VARCHAR(32) NOT NULL,
		class_teacher_phone VARCHAR(64) NOT NULL,
		class_teacher_email VARCHAR(64) NOT NULL,
		PRIMARY KEY(id)
)

INSERT INTO tb_class VALUES(1,"C1","17网络1班","T1","13000000000","2@qq.com");