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
  imported via code in the GitHub repo:
    https://www.github.com/nihonjinrxs/dc311
****************************************/

/* We need more data!!!  Let's use DC311 data. */

select count(*) from dc311.requests;

/* Index on a date field */

DROP INDEX IF EXISTS dc311.requests_resolutiondate_idx;

explain
select * from dc311.requests
where resolutiondate > date '2013-04-01';

CREATE INDEX requests_resolutiondate_idx ON dc311.requests (resolutiondate);

explain
select * from dc311.requests
where resolutiondate > date '2013-04-01';

/* Index on a text field */

DROP INDEX IF EXISTS dc311.requests_servicetypecode_idx;

explain
select * from dc311.requests
where servicetypecode in ('PRSVAVOP','DRIVEHSE');

CREATE INDEX requests_servicetypecode_idx ON dc311.requests (servicetypecode);
vacuum analyze;

explain
select * from dc311.requests
where servicetypecode in ('PRSVAVOP','DRIVEHSE');

/* Index on an expression */

drop INDEX if exists requests_servicetypecode_lower_idx;

explain
select * from dc311.requests
where lower(servicetypecode) in ('prsvavop','drivehse');

CREATE INDEX requests_servicetypecode_lower_idx 
ON dc311.requests (lower(servicetypecode));
vacuum analyze;

explain
select * from dc311.requests
where lower(servicetypecode) in ('prsvavop','drivehse');
