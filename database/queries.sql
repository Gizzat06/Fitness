select * from Paidalanushy;
select * from Abonement;
select * from Trenazher;
select * from VirtualdyKezek;
select * from AqauOtinimi;
select * from Tolem;
select * from JattyguSabagy;
select * from SabakkaJazylu;

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

select adis, max(somasy) as orta from Tolem group by adis

select p.aty, t.atauy, v.kezekNomiri, a.turi, v.kuyi
from Paidalanushy p
inner join Abonement a on
p.id = a.paidalanushy_id
inner join VirtualdyKezek v on
p.id = v.paidalanushy_id
inner join Trenazher t on
v.id = t.id
where a.turi = N'3 айлық' and v.kuyi = N'Күтуде' 

select *
from Abonement
where paidalanushy_id = (
select id
from Paidalanushy
where id = 1
)

select *
from Abonement
where ayaqtaluKuni = (
select max(ayaqtaluKuni)
from Abonement
)

select *
from Paidalanushy
where id in (
select paidalanushy_id
from VirtualdyKezek
)

select *
from Paidalanushy
where id in (
select paidalanushy_id
from AqauOtinimi
)

select *
from Abonement
where ayaqtaluKuni > any (
select ayaqtaluKuni
from Abonement
where paidalanushy_id = 1
)

select *
from Abonement
where ayaqtaluKuni > all (
select ayaqtaluKuni
from Abonement
where paidalanushy_id = 1
)

select * from Abonement
where paidalanushy_id = 
(select id from Paidalanushy where id = 15)

select t.atauy, count(v.id) as kezekSany
from Trenazher t
join VirtualdyKezek v on t.id = v.trenazher_id
group by t.id, t.atauy
having count(v.id) = (
select max(kezekSany)
from (
select count(*) as kezekSany
from VirtualdyKezek
group by trenazher_id
) as esep
)

select * from Tolem where somasy in (20000, 15000, 25000)

select * from JattyguSabagy where atauy like N'___а'

select paidalanushy_id, kuyi,
case
when turi = N'Жылдық' then N'12 ai'
when turi = N'6 айлық' then N'6 ai'
when turi = N'3 айлық' then N'3 ai'
when turi = N'айлық' then N'1 ai'
end as Aisany
from Abonement

select trenazher_id, count(*) as kezekSany
from VirtualdyKezek
group by trenazher_id
having count(*) >= 2

select trenazher_id, count(*) as aqauSany
from AqauOtinimi
group by trenazher_id
having count(*) >= 2

select paidalanushy_id, count(*) as kezekSany
from VirtualdyKezek
group by paidalanushy_id
having count(*) > 1

select paidalanushy_id, count(*) as abonementSany
from Abonement
group by paidalanushy_id
having count(*) >= 2

select abonement_id, sum(somasy) as jalpySoma
from Tolem
where kuyi = N'Төленді'
group by abonement_id
having sum(somasy) > 30000

select adis, avg(somasy) as ortashaSoma
from Tolem
group by adis
having avg(somasy) > 20000

select jattyqtyrushy_id, count(*) as sabakSany
from JattyguSabagy
group by jattyqtyrushy_id
having count(*) >= 2

select t.atauy, count(a.id) as aqauSany
from Trenazher t
inner join AqauOtinimi a
on t.id = a.trenazher_id
group by t.id, t.atauy
having count(a.id) >= 2
order by aqauSany desc
