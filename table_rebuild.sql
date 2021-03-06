select * from pg_class where relname like '%load%';

select to_char(date_trunc('month', getdate()-180),'yyyymmdd');

SELECT * FROM generate_series('2008-03-01 00:00'::timestamp,
                              '2008-03-04 12:00', '10 hours');
                              
select to_char(date_trunc('month', getdate()-180) + days_after, 'yyyymmdd') this_date;

select  to_char(this_date, 'yyyymmdd') this_date
from    (
        select  date_trunc('month', getdate()-180) + days_after this_date
        from    ( SELECT generate_series(0,220) as days_after )
        )
where   this_date <= now();

select  '    {"url":"s3://ramblas/events/click/' || to_char(this_date, 'yyyymmdd') || '/","mandatory":true},' s3_manifest_line
from    (
        select  date_trunc('month', getdate()-180) + days_after this_date
        from    ( SELECT generate_series(0,220) as days_after )
        )
where   this_date <= now();

select  'aws s3 ls --recursive s3://ramblas/events/click/' || to_char(this_date, 'yyyymmdd') || '/ | grep avro$ | awk ''{print $4}''' s3_manifest_line
from    (
        select  date_trunc('month', getdate()-180) + days_after this_date
        from    ( SELECT generate_series(0,220) as days_after )
        )
where   this_date <= now();

select  'aws s3 ls --recursive s3://ramblas/events/click/' || to_char(this_date, 'yyyymmdd') || '/ | grep avro$ | awk ''{print "    {\"url\":\"s3://ramblas/"$4"\", \"mandatory\":true},"}''' s3_manifest_line
from    (
        select  date_trunc('month', getdate()-180) + days_after this_date
        from    ( SELECT generate_series(0,220) as days_after )
        )
where   this_date <= now();

aws s3 ls --recursive s3://ramblas/events/click/20160505/ | grep avro$ | awk '{print "    {\"url\":\"s3://ramblas/"$4"\", \"mandatory\":true},"}'

    {"url":"s3://ramblas/events/click/20161101/00/part-r-00000.avro", "mandatory":true},
    {"url":"s3://ramblas/events/click/20160505/00/part-r-00000.avro", "mandatory":true},

select to_char(date_trunc('month', getdate()-180),'yyyymmdd');

select count(*) from click_event_t1_tmp;

select now();
