drop index if exists dwdc.idx_all_visits_visit_date;

explain 
select * from dwdc.all_visits
where visit_date > date '2009-12-01';

create index idx_all_visits_visit_date on dwdc.all_visits (visit_date);

explain 
select * from dwdc.all_visits
where visit_date > date '2009-12-01';

