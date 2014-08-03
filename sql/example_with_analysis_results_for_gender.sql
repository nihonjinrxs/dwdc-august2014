select * from dwdc.analysis_results_for_gender('f');

select 'm' as gender, avg(growth_rate) as avg_growth_rate
from dwdc.analysis_results_for_gender('m')
union all
select 'f' as gender, avg(growth_rate) as avg_growth_rate
from dwdc.analysis_results_for_gender('f');

