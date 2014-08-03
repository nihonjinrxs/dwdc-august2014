create or replace function dwdc.all_visits_in_timeframe(
  param_start_date date, 
  param_end_date date
) returns table (
  first_name text,
  visit_date date,
  height numeric
) as
$BODY$
select * from dwdc.all_visits
where visit_date between param_start_date and param_end_date
$BODY$ language sql;

select * from dwdc.all_visits_in_timeframe(date '2009-01-01', date '2009-12-31');
select * from dwdc.all_visits_in_timeframe(date '2009-01-01', date '2011-12-31');

