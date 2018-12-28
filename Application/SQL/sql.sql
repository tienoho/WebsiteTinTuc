create table category
(
  category_id     int auto_increment
    primary key,
  category_name   longtext        null,
  category_des    text            null,
  category_slug   varchar(255)    null,
  category_parent int default '0' null,
  constraint category_category_id_uindex
  unique (category_id)
);

create table post
(
  post_id        int auto_increment
    primary key,
  author_id      int          null,
  post_date      datetime     null,
  post_edit_date datetime     null,
  post_title     text         null,
  post_content   longtext     null,
  post_summary   text         null,
  post_status    varchar(10)  null,
  post_slug      text         null,
  post_img       varchar(255) null,
  category_id    int          null,
  constraint post_post_id_uindex
  unique (post_id)
);

create table role
(
  roleid bigint auto_increment
    primary key,
  name   varchar(100) null
);

create table terms_relationships
(
  post_id     int             null,
  category_id int             null,
  `order`     int default '0' null
)
  comment 'bảng kết nối post với category';

create table user
(
  userid      bigint auto_increment
    primary key,
  email       varchar(255) not null,
  password    varchar(255) not null,
  fullname    varchar(300) null,
  createddate timestamp    null,
  roleid      bigint       not null,
  constraint user_email_uindex
  unique (email),
  constraint FK_USER_ROLE
  foreign key (roleid) references role (roleid)
);

create index FK_USER_ROLE_idx
  on users (roleid);

