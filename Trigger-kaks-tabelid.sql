create table logi(
logiID int primary key identity(1,1),
andmded text,
kuupaev datetime,
kasutaja varchar (100)
);


create trigger reservationLisamine
on reservation
for insert
as
insert into logi(kuupaev, andmded, kasutaja)
select GETDATE(),
CONCAT(g.first_name, ' ',g.last_name, ': ', inserted.date_in, ' - ', inserted.date_in, ', ', inserted.made_by),
USER
from inserted
inner join guest g on inserted.guest_ID=g.guest_ID
--kontroll--
insert into reservation(date_in, date_out, made_by, guest_ID)
values('2023-07-25','2023-09-04','for american',3);
select * from reservation;
select * from logi;

XAMPP
insert into logi(kuupaev, andmded, kasutaja)
select NOW(),
CONCAT(g.first_name, ' ',g.last_name, ': ', NEW.date_in, ' - ', NEW.date_in, ', ', NEW.made_by),
USER
from reservation r
inner join guest g
on inserted.guest_ID=g.guest_ID
WHERE r.reservation_id

