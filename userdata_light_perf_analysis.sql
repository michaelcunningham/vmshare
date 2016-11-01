select  *
from    stl_querytext
where   text like '%udl_05_a%'
and     text not like '%query%'
order by query;

select distinct tablename from pg_table_def where tablename like '%query%';

-- udl_01_a
select * from svl_query_summary where query = 3021193 order by stm, seg, step;

select * from svl_query_report where query = 3021193 order by segment, step, slice;

select * from svl_query_report where query = 3021193 and slice in( 45, 6411 ) order by segment, step, slice;

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

select  user_id, count(*)
from    udl_05
group by user_id
having count(*) > 1
order by count(*) desc;

alter table udl_05 modify( user_id not null );

alter table udl_05
add primary key( user_id );
