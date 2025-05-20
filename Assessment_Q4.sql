with clv as (
	select u.id as customer_id,
		   concat(u.first_name,' ', u.last_name) as name,
		   timestampdiff(month, u.date_joined,current_date()) as tenure,
		   count(*) as total_transactions
    from users_customuser u
    inner join savings_savingsaccount s
    on u.id=s.owner_id
	Group by u.id, concat(u.first_name,' ', u.last_name),
             timestampdiff(month, u.date_joined,current_date())
)
select customer_id,name,
       tenure as tenure_month,total_transactions,
       ((total_transactions / tenure) *12 *0.001) as estimated_clv
from clv
order by estimated_clv desc
    
    
    
    
