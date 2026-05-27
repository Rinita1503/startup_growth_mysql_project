use investment_data;
select * from startup_growth_investment_data;

-- Top 10 startups by valuation
select id, industry, country,
round(valuation/1000000000,2) as valuation_billion
from startup_growth_investment_data
order by valuation desc
limit 10;

-- industries receiving maximum funding
select industry, round(sum(investment_amount_usd)/1000000000,2) as total_funding_billion
from startup_growth_investment_data
group by industry
order by total_funding_billion desc;

-- countries receiving most investors
select country, sum(num_investors) as total_investors
from startup_growth_investment_data
group by country
order by total_investors desc;


-- startups with highest growth rate
select id, industry, growth_rate
from startup_growth_investment_data
order by growth_rate desc
limit 15;

-- average funding rounds per industry
select industry, round(avg(funding_rounds),2) as avg_funding_rounds
from startup_growth_investment_data
group by industry
order by avg_funding_rounds desc;

-- valuation to investment ratio
select id,
round(valuation/investment_amount_usd,2) as valuation_ratio
from startup_growth_investment_data
order by valuation_ratio desc
limit 20;

-- startups founded after 2018 with high_growth
select id, industry, country, year_founded, growth_rate
from startup_growth_investment_data
where year_founded > 2018
and growth_rate > 100
order by growth_rate desc;