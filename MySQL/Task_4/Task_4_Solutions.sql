-- (1) Combine Two Tables
select P.firstName, P.lastName, A.city, A.state
from Person P left join Address A on P.personId = A.personId;

-- (2) Replace Employee ID With The Unique Identifier
select EmployeeUNI.unique_id, Employees.name
from EmployeeUNI
    right join Employees
    on EmployeeUNI.id = Employees.id;

-- (3) Customer Who Visited but Did Not Make Any Transactions
select customer_id, count(customer_id) as count_no_trans
from visits
where visit_id not in (select V.visit_id
from Visits V
    join Transactions T on V.visit_id = T.visit_id)
group by customer_id;

-- (4) Project Employees I
select P.project_id, ROUND(AVG(E.experience_years), 2) as average_years
from Project P join Employee E on P.employee_id = E.employee_id
group by project_id;

-- (5) Sales Person
select S.name
from SalesPerson S
where S.sales_id not in
(select O.sales_id
from Orders O join Company C on O.com_id = C.com_id
where C.name = 'RED');

-- (6) Rising Temperature
select W.id
from Weather W join Weather H
    on datediff(W.recordDate, H.recordDate) = 1
where W.temperature > H.temperature;

-- (7) Average Time of Process per Machine
select A.machine_id, round(avg(A.timestamp - B.timestamp), 3) as processing_time
from Activity A join Activity B on A.machine_id = B.machine_id and A.process_id = B.process_id
where A.activity_type = 'end' and B.activity_type = 'start'
group by A.machine_id;

-- (8) Students and Examinations
select s.student_id, s.student_name, sub.subject_name, count(e.subject_name) as
attended_exams
from Students s
cross join Subjects sub
    left join Examinations e on e.student_id = s.student_id
        and e.subject_name = sub.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name;

-- (9) Managers with at Least 5 Direct Reports
select e.name
from Employee e join Employee m on e.id = m.managerId
group by m.managerId
having count(m.managerId) >= 5;

-- (10) Confirmation Rate
select s.user_id, round(
if(count(c.action) = 0, 0, sum
(c.action = 'confirmed') / count
(c.action)), 2) AS confirmation_rate
from Signups s
left join Confirmations c
    on s.user_id = c.user_id
group by s.user_id;

-- (11) Product Sales Analysis III
select a.product_id, b.first_year, a.quantity, a.price
from Sales a join (select product_id, min(year) as first_year
    from Sales
    group by product_id) as b on a.product_id = b.product_id
        and a.year = b.first_year

-- (12) Market Analysis I
select u.user_id as buyer_id, u.join_date, count(case when year(o.order_date) = 2019 then 1 end) as orders_in_2019
from Users u
    left join Orders o
    on o.buyer_id = u.user_id
group by u.user_id;