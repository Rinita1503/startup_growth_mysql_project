select * from startup_growth_investment_data;
-- count total rows
select count(*) as total_records
from startup_growth_investment_data;
select * from startup_growth_investment_data
limit 10;

describe startup_growth_investment_data;
set sql_safe_updates = 0;

-- text formatting
-- skipping double blank spaces or leading or trailing
update startup_growth_investment_data
set country = trim(country);

-- changing text columns from upper case to fully lower case
update startup_growth_investment_data
set country = lower(country);



select * from startup_growth_investment_data;

-- check null values
select * from startup_growth_investment_data
where id is null
or industry is null
or investment_amount_usd is null;

-- remove duplicate records
select id, count(*)
from startup_growth_investment_data
group by id
having count(*) > 1;

-- validate numeric columns
select *
from startup_growth_investment_data
where investment_amount_usd < 0
or valuation < 0
or growth_rate <0;

set sql_safe_updates = 1;

select * from startup_growth_investment_data;





