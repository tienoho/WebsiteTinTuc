CREATE DATABASE  IF NOT EXISTS `tintuc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tintuc`;

CREATE TABLE `role` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_USER_ROLE_idx` (`roleid`),
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- auto-generated definition
create table category
(
  category_id   int auto_increment
    primary key,
  category_name longtext     null,
  category_slug varchar(255) null,
  constraint category_category_id_uindex
  unique (category_id)
);

-- auto-generated definition
create table post
(
  post_id        int auto_increment
    primary key,
  authorID       int         null,
  post_date      datetime    null,
  post_edit_date int         null,
  post_content   longtext    null,
  post_title     text        null,
  post_status    varchar(10) null,
  post_slug      text        null,
  constraint post_post_id_uindex
  unique (post_id)
);


