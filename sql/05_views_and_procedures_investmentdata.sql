use investment_data;


select * from startup_growth_investment_data;

-- create view for high growth startups
create view high_growth_startups as
select id, industry, country, growth_rate
from startup_growth_investment_data
where growth_rate > 100;

-- stored procedure
delimiter //
create procedure top_industry_investments()
begin
select industry,
round(sum(investment_amount_usd)/1000000000,2) as total_investment_billion
from startup_growth_investment_data
group by industry
order by total_investment_billion desc;
end //