/***************************************
  Data Wranglers DC : August 2014 Meetup
  SQL, the Sequel
  **************************************
  Author:  Ryan B. Harvey
  Created: 2014-08-02
  **************************************
  This script creates a custom SQL
  function to get all rows from the 
  analysis query where the patient is 
  od the specified gender from the data 
  imported by the script:
    import_revised.sql
****************************************/

create or replace function dwdc.analysis_results_for_gender(param_gender character(1))
  returns table (id integer, first_name text, growth_rate double precision) as
$BODY$
   WITH all_visits_and_ids(id, first_name, dob, visit_date, height) AS (
         SELECT i.id, 
            i.first_name, 
            i.dob, 
            v.visit_date, 
            v.height
           FROM dwdc.ids i
      LEFT JOIN dwdc.all_visits v ON i.first_name = v.first_name
          where i.gender = upper(param_gender) 
        ), all_visits_and_ids_with_age(id, first_name, dob, age, visit_date, height) AS (
         SELECT all_visits_and_ids.id, 
            all_visits_and_ids.first_name, 
            all_visits_and_ids.dob, 
            date_part('epoch'::text, age(all_visits_and_ids.visit_date::timestamp with time zone, all_visits_and_ids.dob::timestamp with time zone)) / (3600 * 24)::double precision / 365.25::double precision AS age, 
            all_visits_and_ids.visit_date, 
            all_visits_and_ids.height
           FROM all_visits_and_ids
        )
 SELECT all_visits_and_ids_with_age.id, 
    all_visits_and_ids_with_age.first_name, 
    regr_slope(all_visits_and_ids_with_age.height::double precision, all_visits_and_ids_with_age.age) AS growth_rate
   FROM all_visits_and_ids_with_age
  GROUP BY all_visits_and_ids_with_age.id, all_visits_and_ids_with_age.first_name
  ORDER BY all_visits_and_ids_with_age.id;
$BODY$ language sql;