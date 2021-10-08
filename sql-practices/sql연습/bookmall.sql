desc member;

-- drop table ;

insert into member values(null, '성창현','010-6234-3250', 'eogkdfh@gmail.com', password('1234'));
select * from member;

delete from member where no = 4;
select no,mem_name, phone, email, password
from member;

desc category;
insert into category values(null, "과학");
insert into category values(null, "인문");
insert into category values(null, "경제");
select * from category;
select cate_name from category;

desc book;
insert into book values(null, "백범일지", 30000, 2);
insert into book values(null, "코스모스", 50000, 1);
insert into book values(null, "거시경제학", 40000, 3);
select * from book;

select b.title, c.cate_name, b.price 
from book b join category c on b.category_no = c.no;

delete from book where no = 4;

desc cart;
insert into cart values(null, 3, 2, 2);
insert into cart values(null, 4, 3, 1);
select * from cart;


select b.title, c.amount, (c.amount * b.price), m.mem_name
from cart c join member m on c.member_no = m.no
		    join book b on c.book_no = b.no;

delete from cart where no = 5;

select * from member;

desc order_book;
insert into order_book values(null,3, 2, 1);
insert into order_book values(null,4, 3, 1);
insert into order_book values(null,4, 3, 2);
insert into order_book values(null,1, 1, 2);
select * from order_book;


desc orders;
insert into orders values(null, 'b02412', '부산시 연제구', 1);
insert into orders values(null, 's02412', '부산시 부산진구', 2);
select * from orders;

select sum(ob.amount * b.price)
          from order_book ob join book b on ob.book_no = b.no
where ob.orders_no = 1;

select o.order_no , 
       m.mem_name ,
	   m.email,
       (select sum(ob.amount * b.price)
          from order_book ob join book b on ob.book_no = b.no
         where ob.orders_no = o.no) , 
       o.address
from orders o join member m on o.member_no = m.no;
			  
desc order_book;
insert into order_book values(null,3, 2, 1);
insert into order_book values(null,4, 3, 1);
insert into order_book values(null,4, 3, 2);
insert into order_book values(null,1, 1, 2);
select * from order_book;             

select ob.book_no, b.title, ob.amount
from order_book ob join book b on ob.book_no = b.no;




