create or replace function dwdc.age_at_visit(param_visit_date date, param_date_of_birth date)
returns double precision as $$
  select date_part('epoch', age( param_visit_date, param_date_of_birth )) / (3600 * 24) / 365.25 AS age;
$$ language sql;

select dwdc.age_at_visit(date '2010-04-02', date '2009-01-01'); -- roughly 1.25 years
