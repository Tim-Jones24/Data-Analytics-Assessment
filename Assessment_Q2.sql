with base as (
	select
		u.id,
        extract(year from transaction_date) as yrs,
        extract(month from transaction_date) as mth,
        count(*) as trans_count,
        avg(confirmed_amount) as avg_trans
	from users_customuser u
    inner join savings_savingsaccount s on u.id = s.owner_id
    group by u.id, extract(year from transaction_date) ,extract(month from transaction_date)
)
select 
	id, yrs, mth,
    case 
		when trans_count >= 10 then 'High Frequency'
		when trans_count >= 3 and  trans_count <= 9 then 'Medium Frequency'
		else 'Low Frequency'
	end as frequency_category,
    avg_trans as trans_count, avg_trans as avg_transactions_per_month
from base
order by yrs , mth , avg_trans desc;