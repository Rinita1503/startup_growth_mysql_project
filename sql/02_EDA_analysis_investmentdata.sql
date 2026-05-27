use investment_data;

select * from startup_growth_investment_data;

-- total startups
select count(*) as total_startups
from startup_growth_investment_data;

-- distinct industries
select distinct industry
from startup_growth_investment_data;

-- total investment by industry
select industry,
round(sum(investment_amount_usd)/1000000000,2) as total_investment_billion
from startup_growth_investment_data
group by industry
order by total_investment_billion desc;


-- average valuation by country
select country,
round(avg(valuation)/1000000000,2) as avg_valuation_billion
from startup_growth_investment_data
group by country
order by avg_valuation_billion desc;

-- average growth rate by industry
select industry,
round(avg(growth_rate),2) as avg_growth_rate
from startup_growth_investment_data
group by industry
order by avg_growth_rate desc;

select * from startup_growth_investment_data;










