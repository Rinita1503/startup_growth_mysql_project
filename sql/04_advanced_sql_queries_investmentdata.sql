use investment_data;

select * from startup_growth_investment_data;


-- window functions
-- window functions are allowed to work on a subset of rows related to the current row, while the query is being processed
-- rank startups by valuation within industry
select id, industry, valuation, rank() over (partition by industry order by valuation desc) as industry_rank
from startup_growth_investment_data;

-- CTE example
with avg_growth as (select industry, avg(growth_rate) as avg_growth
from startup_growth_investment_data
group by industry)
select *
from avg_growth
order by avg_growth desc;

-- Dense ranking
-- Dense Ranking is a window function in mysql that assigns a unique rank to each row within a partition, based on a specified ordering
select id, country, valuation, dense_rank() over(partition by country order by valuation desc)
from startup_growth_investment_data;

-- NTILE Segmentation
-- NTILE() is a window segmentation in mysql that divides an ordered data set into a specified number of roughly equal groups
select id, valuation, ntile(4) over(order by valuation desc) as valuation_quartile
from startup_growth_investment_data;