with orders as(

select * from {{ref('stg_jaffle_shop__orders')}}

),
with customers as(

  select * from {{ref('dim_customers')}} 
),
with payments as(
   select * from {{ref('stg_stripe_payments')}}   
)
select orders.order_id,
orders.customer_id,
payments.amount
from payments paym
inner join orders ords
    ON paym.order_id=ords.order_id
inner join customers cust
    ON paym.customer_id=cust.customer_id    