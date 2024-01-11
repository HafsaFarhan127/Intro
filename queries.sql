
select make,model,year,count(fine_id) as number_of_fines
from car left join fine on car.car_id=fine.car_id
 group by make,model,year;  /* Q3*/
 


/*Q4*/
explain select first_name,last_name,phone,date_created from member
inner join queue on member.member_id=queue.member_id
order by date_created;

create index ind_queue_date_created on queue(date_created);














/*join across three tables,easier way to do it also Q1*/
 explain select make,model,year,concat(first_name,' ',last_name) as member,details
from car inner join review on car.car_id=review.car_id
inner join member on review.member_id=member.member_id
where model='Soul' and year=2016;

create index ind_car_model on car(model);
create index ind_review on review(member_id,details,car_id);



/*Q2*/
select first_name,last_name,phone,DATE_FORMAT(license_expiry,"%M %d,%Y") as expired
from member where license_expiry <curdate();

/*Q6*/
select plate,make,model,year from car
where car_id not in (select car_id from service);

select car_id from car where make='Toyota';
select * from queue;

/*Q5*/
select concat(first_name,' ',last_name) as member,concat(make,' ',model) as 
car,datediff(curdate(),date_expires) as expired_days_ago
from queue join car on queue.car_id=car.car_id 
join member on member.member_id=queue.member_id;


/*Q7 to solve the ambiguous thing,just specify the table we want attr from */
select first_name,last_name,count(distinct car.car_id) as number_cars
from member  join rental_agreement on member.member_id=rental_agreement.member_id
 join car on rental_agreement.car_id=car.car_id
group by member.member_id,first_name,last_name
having number_cars>1;

/*Q8*/
select * from rental_agreement;
select model from car where car_id=3 or car_id=9;
select first_name,last_name from member
where member_id in
(select member_id from rental_agreement join car on rental_agreement.car_id=car.car_id
where model='Civic' )
and member_id in
(select member_id from rental_agreement join car on rental_agreement.car_id=car.car_id
where model='Elantra');

/*Q9*/
select
    first_name,last_name,
    SUM(invoice_item.amount) as total_amount,-SUM(payment.amount) as total_amount
from member join invoice as invoice on member.member_id = invoice.member_id
left join invoice_item on invoice.invoice_id = invoice_item.invoice_id
GROUP BY m.first_name, m.last_name

UNION

-- Query for negative payments (to subtract from invoice totals)
select first_name,last_name,
    -SUM(payment.amount) as total_amount
from member  join invoice on member.member_id = invoice.member_id
left join payment on invoice.invoice_id = payment.invoice_id
group by first_name, last_name;




/*try*/
select
    member.first_name,member.last_name,
    sum(invoice_item.amount)  as total_amount
from invoice join invoice_item on invoice.invoice_id = invoice_item.invoice_id
join member  on member.member_id = invoice.member_id
UNION

-- Query for negative payments (to subtract from invoice totals)
select first_name,last_name,
    -amount
from payment  join invoice on invoice.invoice_id = payment.invoice_id
join member on member.member_id = invoice.member_id;




SELECT member.first_name, member.last_name, sum(invoice_item.amount)
FROM invoice
JOIN invoice_item ON invoice.invoice_id = invoice_item.invoice_id
JOIN member ON member.member_id = invoice.member_id
group by member.first_name,member.last_name
union 
SELECT  first_name,last_name, -sum(payment.amount)
FROM payment
JOIN invoice ON invoice.invoice_id = payment.invoice_id
JOIN member on member.member_id = invoice.member_id
group by member.first_name,member.last_name;
