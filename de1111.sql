drop table if exists borrow_detail;
drop table if exists book_author;
drop table if exists borrow;
drop table if exists reader;
drop table if exists book;
drop table if exists author;
 
 
 create table if not exists reader (
reader_id int auto_increment,
reader_name varchar(50),
dob date,
sex bit,
phone varchar(20),
primary key (reader_id)
);
    
  create table if not exists borrow(
borrow_id int auto_increment,
reader_id int not null,
borrow_date datetime not null,
foreign key (reader_id) REFERENCES reader(reader_id),
primary key (borrow_id)
);

create table if not exists book(
book_id int auto_increment,
title varchar(100) not null,
category varchar(50) not null,
Descr varchar(5000),
primary key (book_id )
);

create table if not exists borrow_detail(
borrow_detail_id int auto_increment,
book_id int not null,
borrow_id int not null,
quantity int not null,
foreign key (book_id) REFERENCES book(book_id),
foreign key (borrow_id) REFERENCES borrow(borrow_id),
primary key (borrow_detail_id)
);

create table if not exists author (
	author_id int auto_increment,
    author_name varchar(50),
    sex bit,
    primary key (author_id)
    );

create table if not exists book_author(
book_author_id int auto_increment,
book_id int not null,
author_id int not null,
foreign key (book_id) REFERENCES book(book_id),
foreign key (author_id) REFERENCES author(author_id),
primary key (book_author_id)
);




insert into reader(reader_name,dob,sex,Phone)
values
("Le Van Hiep","1991-11-07",1,"0989888888"),
("Do Nam Long","1997-04-14",1,"0969856663"),
("Do Van Minh","2001-04-05",1,"0914521451"),
("Phan Van Duc","1998-11-07",1,"0989666666"),
("Nguyen Thi Tham","1998-10-07",0,"0886144144"),
("Le Van Huy","1995-12-07",1,"0989123456");

insert into borrow(reader_id,borrow_date)
values
(1,"2011-01-11 11:11:11"),
(2,"2011-01-12 01:11:11"),
(3,"2011-01-18 22:11:11"),
(1,"2011-02-11 23:11:11"),
(4,"2011-02-22 12:11:11"),
(5,"2011-02-24 08:11:11"),
(3,"2011-03-01 10:11:11");

insert into book(title, category, Descr)
values
("Dặm xanh", "Hư cấu kỳ ảo", ""),
("Nghĩa địa động vật", "Kinh dị viễn tưởng", ""),
("Đối đầu", "Hư cấu kỳ ảo", ""),
("Rita Hayworth and Shawshank Redemption", "Tiểu thuyết", ""),
("Bắt trẻ đồng xanh", "Tiểu thuyết", ""),
("Tiếng chim hót trong bụi mận gai", "Tiểu thuyết", ""),
("Đồi gió hú", "Tiểu thuyết", ""),
("Cuốn theo chiều gió", "Tiểu thuyết", ""),
("Rừng Nauy", "Tiểu thuyết", ""),
("Hồng lâu mộng", "Tiểu thuyết", ""),
("Cuộc dạo chơi kéo dài", "Tiểu thuyết", "")
;

insert into borrow_detail(borrow_id, book_id, quantity)
values
(1,1,1),
(1,2,1),
(1,3,1),
(1,4,1),
(1,5,1),
(1,6,1),
(1,7,1),
(1,8,1),
(1,9,1),
(1,10,1),
(2,1,5),
(3,5,1),
(3,6,3),
(4,7,1),
(4,3,2),
(4,1,6),
(5,2,1),
(5,4,11),
(6,1,2),
(6,7,12),
(7,1,3),
(7,2,2),
(7,3,11);

insert into author(author_name, sex)
values
("Stephen King",1),
("Richard Bachman",1),
("Murakami",1),
("Margaret Mitchell",0),
("J.D.Salinger",1),
("Cao Ngạc",1),
("Tào Tuyết Cần",1),
("Emily Bronte",0),
("Colleen McCullough",0)
;

insert into book_author(book_id, author_id)
values
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 4),
(6, 9),
(7, 8),
(8, 4),
(9, 3),
(10, 7),
(11, 1),
(11, 2)
;