/***************************************
  Data Wranglers DC : August 2014 Meetup
  SQL, the Sequel
  **************************************
  Author:  Ryan B. Harvey
  Created: 2014-08-04
  **************************************
  This script demonstrates performance
  tuning using the EXPLAIN keyword and 
  indexes on columns for the data 
  imported by the script:
    import_revised.sql
****************************************/

drop index if exists dwdc.idx_all_visits_visit_date;

explain 
select * from dwdc.all_visits
where visit_date > date '2009-12-01';

create index idx_all_visits_visit_date on dwdc.all_visits (visit_date);

explain 
select * from dwdc.all_visits
where visit_date > date '2009-12-01';

