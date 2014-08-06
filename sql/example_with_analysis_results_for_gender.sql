/***************************************
  Data Wranglers DC : August 2014 Meetup
  SQL, the Sequel
  **************************************
  Author:  Ryan B. Harvey
  Created: 2014-08-02
  **************************************
  This script is an example query using
  the custom SQL function that gets 
  analysis results by gender for the 
  data imported by the script:
    import_revised.sql
****************************************/

select * from dwdc.analysis_results_for_gender('f');

select 'm' as gender, avg(growth_rate) as avg_growth_rate
from dwdc.analysis_results_for_gender('m')
union all
select 'f' as gender, avg(growth_rate) as avg_growth_rate
from dwdc.analysis_results_for_gender('f');

