select  count(b.*) dupe_count, row_count
from    (
        select  count(1) dupe_count
        from    security_event
        where   dt >= '2016-10-26 00:00:00'
        and   dt < '2016-10-27 00:00:00'
        group by redshift__event_md5_hash
        having count(1) > 1
        ) a,
        (
        select  count(1) row_count
        from    security_event
        where   dt >= '2016-10-26 00:00:00'
        and   dt < '2016-10-27 00:00:00'
        ) b
group by b.row_count;
