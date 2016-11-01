set query_group to bigdata;
\timing on

select  /* mu01 */ sum( profiles_viewed )
from    (
        select  u.*, (split_part(ip_address, '.', 1)::bigint << 24)
                        + (split_part(ip_address, '.', 2)::bigint << 16)
                        + (split_part(ip_address, '.', 3)::bigint << 8)
                        + (split_part(ip_address, '.', 4)::bigint) as ipInt,
                0 as pets, cast(0 as numeric) as usd_amt,
                0 as vip, 0 as pFunnel, 0 as badtag, cast(null as varchar(256)) as isp,
                cast(null as varchar(256)) as ispdomain, cast(null as char(2)) as reg_iso,
                0 as badisp, cast(null as varchar(100)) as photohash,
                cast(null as varchar(256)) as tagline, cast(null as varchar(256)) as displayname,
                0 as msgs, cast(null as varchar(256)) as ua    
        from    userdata_light u    
        where   date_registered::date>='2016-10-26'
        );


set query_group to bigdata;
\timing on

select  /* mu02 */ sum( profiles_viewed )
from    (
        select  u.*, (split_part(ip_address, '.', 1)::bigint << 24)
                        + (split_part(ip_address, '.', 2)::bigint << 16)
                        + (split_part(ip_address, '.', 3)::bigint << 8)
                        + (split_part(ip_address, '.', 4)::bigint) as ipInt,
                0 as pets, cast(0 as numeric) as usd_amt,
                0 as vip, 0 as pFunnel, 0 as badtag, cast(null as varchar(256)) as isp,
                cast(null as varchar(256)) as ispdomain, cast(null as char(2)) as reg_iso,
                0 as badisp, cast(null as varchar(100)) as photohash,
                cast(null as varchar(256)) as tagline, cast(null as varchar(256)) as displayname,
                0 as msgs, cast(null as varchar(256)) as ua    
        from    userdata_light_new u    
        where   date_registered::date>='2016-10-26'
        );



set query_group to bigdata;
\timing on

select  /* mlu01 */ *
from    lh_galaxy l
        join userdata_light u
                on l.sender_user_id = u.user_id    
where   ct >= 5
and     gender = 'F'
order by ct;

set query_group to bigdata;
\timing on

select  /* mlu02 */ *
from    lh_galaxy l
        join userdata_light_new u
                on l.sender_user_id = u.user_id    
where   ct >= 5
and     gender = 'F'
order by ct;

