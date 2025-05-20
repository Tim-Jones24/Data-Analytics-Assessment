with high_vc as (
	 select s.owner_id as owner_id,
            concat(u.first_name,' ', u.last_name) as name,
            sum(p.is_regular_savings) as savings_count,
            sum(p.is_fixed_investment) as investment_count,
            sum(s.confirmed_amount) as total_deposit
     from savings_savingsaccount s
     inner join users_customuser u
     on s.owner_id=u.id
     inner join plans_plan p
     on s.plan_id= p.id
     where p.is_regular_savings= 1 or p.is_fixed_investment= 1
     Group by s.owner_id, concat(u.first_name,' ', u.last_name)
     Having sum(p.is_regular_savings)>= 1 and sum(p.is_fixed_investment)>= 1
)
select *
from high_vc
order by total_deposit desc




