
--1.Finding a band with id equals 93
select *
from band
where band_id = 93;

--2.Message a top 10 rows in table 'album'
select *
from album
limit 10;

--3.Finding a band with id equals 93 or 192

select *
from band
where 
	band_id = 93
	or band_id = 192;

--4.Finding a band that was created less 1980 and have comment
select *
from band
where
	year < 1980
	and comment <> '';

--5.Finding a band with name have part 'Led Zeppelin' and message result with only by coloumns 'band_id', 'name' and 'year'
select band_id, name, year
from band
where
	name like '%Led Zeppelin%';

--6.Finding a few bands with ids 93, 192 and 303 by IN
select *
from band
where
	band_id in(93, 192, 303);

--7.Finding bands that stores in table 'list1'
select *
from band
where
	band_id in(select id
				from list1);

--8.Finding albums that writen by band with name have part 'Led Zeppelin'
select *
from album
where
	band_id in(select band_id
				from band
				where
					name like '%Led Zeppelin%');

--9.Finding a music instrument that have not parents instrument
select *
from music_instrument
where
	parent_id is null;

--10.Finding a band with name 'Icarus' and have not year in DB
select *
from band
where
	name = 'Icarus'
	and year is null;

--11.Finding a count of band albums
select b.name, count(a.album_id)
from album as a, band as b
where
	a.band_id = b.band_id
group by
	b.name
order by
	count desc;

--12.Message a band with name 'Led Zeppelin' and their albums information
select *
from band as b
inner join album as a
	on a.band_id = b.band_id
where b.name = 'Led Zeppelin';

--13.