select * from Paidalanushy;
select * from Abonement;
select * from Trenazher;
select * from VirtualdyKezek;
select * from AqauOtinimi;

update Abonement
set kuyi = N'Аяқталған'
where id = 2

delete from Abonement
where id = 6

select aty, telefon from Paidalanushy
where rol = N'Клиент' and telefon like '8747%'

select * from Abonement
where bastaluKuni > '2026-01-01' and ayaqtaluKuni < '2026-10-31'

select distinct rol from Paidalanushy

select * from Abonement
order by bastaluKuni

select rol,count(*) as sany
from Paidalanushy
group by rol

select min(bastaluKuni) as minimum from Abonement

select count(*) as abonementsany from Abonement

select kuyi, count(*) as sany
from Trenazher
group by kuyi
having count(*) >= 3

select aty,turi
from Paidalanushy
inner join Abonement
on Paidalanushy.id = Abonement.paidalanushy_id

select p.aty, count(a.id) as abonementSany
from Paidalanushy p
left join Abonement a on p.id = a.paidalanushy_id
group by p.id, p.aty
order by abonementSany desc;

select t.atauy, count(v.id) as sany
from Trenazher t
inner join VirtualdyKezek v on t.id = v.trenazher_id
group by t.id,t.atauy

select turi, count(*) as sany
from Abonement
group by turi
order by sany

select t.atauy, count(a.id) as sany
from Trenazher t
join AqauOtinimi a on t.id = a.trenazher_id
group by a.id, t.atauy