select  count(b.*) dupe_count, row_count
from    (
        select  count(1) dupe_count
        from    mess_event
        where   dt >= '2016-10-31 06:00:00'
        and   dt < '2016-10-31 09:00:00'
        group by redshift__event_md5_hash
        having count(1) > 1
        ) a,
        (
        select  count(1) row_count
        from    mess_event
        where   dt >= '2016-10-31 06:00:00'
        and   dt < '2016-10-31 09:00:00'
        ) b
group by b.row_count;

select  count(b.*) dupe_count, row_count
from    (
        select  count(1) dupe_count
        from    payment_funnel_event
        where   dt >= '2016-10-26 00:00:00'
        and   dt < '2016-10-27 00:00:00'
        group by redshift__event_md5_hash
        having count(1) > 1
        ) a,
        (
        select  count(1) row_count
        from    payment_funnel_event
        where   dt >= '2016-10-26 00:00:00'
        and   dt < '2016-10-27 00:00:000'
        ) b
group by b.row_count;



select 2 / 7602014::decimal;

echo "scale=4;5297*100000/115756" | bc

echo "5297*100000/115756" | bc

echo "2*100000/7602014" | bc

 echo "scale=4;36*100000/7602014" | bc
 
