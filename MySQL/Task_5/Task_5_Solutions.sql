-- Duplicate Emails
select email as Email
from Person
group by email
having count(email) > 1;

-- Delete Duplicate Emails
delete p1
from Person p1 join Person p2 on p1.email = p2.email
where p1.id > p2.id;

-- Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
      #
    Write your MySQL query statement below.
    select
        case 
                when N < 1 then null
                else (
                    select distinct salary
        from Employee e1
        where N = 1
            or N <= (select count(distinct salary)
            from Employee e2
            where e2.salary >= e1.salary)
        order by salary desc
                    limit 1
                )
            END
  );
END

-- Rank Scores
select score, dense_rank() over (order by score desc) as 'rank'
    from Scores
    order by score desc;

    -- Department Highest Salary
    select d.name as Department, e.name as Employee, e.salary as Salary
    from (select *, dense_rank() over (partition by departmentId order by salary desc) as rnk
        from Employee) e
        join Department d on e.departmentId = d.id
    where e.rnk = 1;