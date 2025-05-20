with account_transactions as(
	select
		p.id as plan_id,
        s.owner_id,
        p.description as type,
        s.transaction_date,
        row_number() over (partition by p.id order by transaction_date desc) as num
    from savings_savingsaccount s
    inner join plans_plan p on s.plan_id = p.id
),
last_trans as(
	select
		plan_id,
        owner_id,
        type,
        transaction_date as last_transaction_date,
        datediff(current_date(), transaction_date) as inactivity_days
    from account_transactions
    where num = 1 and datediff(current_date(), transaction_date) > 365
)
select 
* 
from last_trans
order by inactivity_days desc