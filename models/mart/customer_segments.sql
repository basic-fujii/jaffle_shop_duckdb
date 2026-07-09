with customer_segments as (

   select
        customer_id,
        first_name,
        last_name,
        first_order,
        most_recent_order,
        number_of_orders,
        customer_lifetime_value,
        case
            when number_of_orders is null then 'prospect' 
            when number_of_orders = 0 then 'prospect'
            when number_of_orders = 1 then 'new'
            when number_of_orders = 2 or number_of_orders =3 then 'returning'
            when number_of_orders >= 4 then 'loyal'
            else 'negative_value'
        end as customer_segment
    
    from  {{ ref('customers') }}
)

select * from customer_segments