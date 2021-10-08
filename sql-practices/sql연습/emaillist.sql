-- emaillist
desc emaillist;


-- insert
insert 
  into emaillist
values (null, '둘', '리', 'dooly@gmaill.com');

-- select
select no,first_name, last_name, email 
  from emaillist
order by no desc;

delete from emaillist where no = 2;


