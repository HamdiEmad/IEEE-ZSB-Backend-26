-- Invalid Tweets
select tweet_id
from Tweets
where CHAR_LENGTH(content) > 15

-- Fix Names in a Table
select user_id, concat(upper(left(name, 1)), lower(substring(name, 2))) as name
from Users
order by user_id;

-- Calculate Special Bonus
select employee_id, 
if(employee_id % 2 = 1 and name not like 'M%', salary, 0) as bonus
from Employees
order by employee_id;

-- Patients With a Condition
select patient_id, patient_name, conditions
from Patients
where conditions like '% DIAB1%' or conditions like 'DIAB1%';

-- Find Total Time Spent by Each Employee
select event_day as day, emp_id, sum(out_time - in_time) as total_time
from Employees
group by emp_id, event_day;

-- Find Followers Count
select user_id, count(follower_id) as followers_count
from Followers
group by user_id
order by user_id asc;

-- Daily Leads and Partners
select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by make_name, date_id;

-- Actors and Directors Who Cooperated At Least Three Times
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(*) >= 3;

-- Classes With at Least 5 Students
select class
from Courses
group by class
having count(*) >= 5;

-- Game Play Analysis I
select player_id, min(event_date) as first_login
from Activity
group by player_id;

-- Capital Gain/Loss
select stock_name, sum(case when operation = 'Sell' then price else -price end) as capital_gain_loss
from Stocks
group by stock_name;

-- Second Highest Salary
select (select max(salary)
    from Employee
    where salary < (select max(salary)
    from Employee)) as SecondHighestSalary;