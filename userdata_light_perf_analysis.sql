select  *
from    stl_querytext
where   text like '%udl_01_v%'
and     text not like '%query%'
order by query;

-- 3065058

select  *
from    stl_querytext
where   query = 3065100;

select distinct tablename from pg_table_def where tablename like '%query%';

select distinct tablename, "column" from pg_table_def where "column" like '%slice%';

/* Test user_id values
7327907061
7327906997
7327906933
7327906869  \set n_user_id 7327906869
7327906805  \set n_user_id 7327906805
7327906741  \set n_user_id 7327906741
7327906677  \set n_user_id 7327906677
7327906613  \set n_user_id 7327906613
7327906549  \set n_user_id 7327906549
7327906485  \set n_user_id 7327906485
*/

select * from userdata_light_new limit 10;

-- udl_01_a - 3021193
select * from svl_query_summary where query = 3045452 order by stm, seg, step;

select * from svl_query_report where query = 3045452 order by segment, step, slice;

select * from svl_query_report where query = 3031991 and slice in( 45, 6411 ) order by segment, step, slice;

-- udl_02_a
select * from svl_query_summary where query = 3021365 order by stm, seg, step;

select * from svl_query_report where query = 3021365 order by segment, step, slice;

select * from svl_query_report where query = 3021365 and slice in( 31, 6414 ) order by segment, step, slice;

-- udl_03_a
select * from svl_query_summary where query = 3021456 order by stm, seg, step;

select * from svl_query_report where query = 3021456 order by segment, step, slice;

-- udl_04_a
select * from svl_query_summary where query = 3021602 order by stm, seg, step;

select * from svl_query_report where query = 3021602 order by segment, step, slice;

select * from svl_query_report where query = 3021602 and slice in( 45, 6411 ) order by segment, step, slice;

-- udl_05_a
select * from svl_query_summary where query = 3029640 order by stm, seg, step;

select * from svl_query_report where query = 3029640 order by segment, step, slice;

select * from svl_query_report where query = 3029640 and slice in( 45, 6411 ) order by segment, step, slice;

-- udl_05_b
select * from svl_query_summary where query = 3045498 order by stm, seg, step;

select * from svl_query_report where query = 3045498 order by segment, step, slice;

select * from svl_query_report where query = 3045498 and slice in( 45, 6412 ) order by segment, step, slice;

select  user_id, count(*)
from    udl_05
group by user_id
having count(*) > 1
order by count(*) desc;

alter table udl_05 modify( user_id not null );

alter table udl_05 add primary key( user_id );
