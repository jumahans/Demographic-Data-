select *
from Sheet1$


--How many people of each race are represented in this dataset?
select race, count(race) as race_count
from Sheet1$
group by race

--What is the average age of men?
select avg(age) as avarage_age_of_men
from Sheet1$
where sex = 'Male'


--What is the percentage of people who have a Bachelor's degree?
select
(count(education)*  100) / (select count(education) from Sheet1$)  as percentage
from Sheet1$
where education = 'Bachelors'

--What percentage of people with advanced education (Bachelors, Masters, or Doctorate) make more than 50K?
select
(count(education)*  100) / (select count(education) from Sheet1$)  as percentage
from Sheet1$
where education in ('Bachelors', 'Master' ,'Doctorate') and [salary] = '>50K'

--What percentage of people without advanced education.
select
(count(education)*  100) / (select count(education) from Sheet1$)  as percentage
from Sheet1$
where education not in ('Bachelors', 'Master', 'Doctorate')

--What percentage of people without advanced education make more than 50K?
select
(count(education)*  100) / (select count(education) from Sheet1$)  as percentage
from Sheet1$
where education not in ('Bachelors', 'Master', 'Doctorate') and [salary] = '>50K'

--What is the minimum number of hours a person works per week?
select min([hours-per-week]) as minimum_number_of_hours
from Sheet1$

--What percentage of the people who work the minimum number of hours per week have a salary of more than 50K?
select 
(count([hours-per-week]) * 100) / (select count([hours-per-week]) from Sheet1$ where [hours-per-week] = (select min([hours-per-week]) from Sheet1$))
from Sheet1$
where [hours-per-week] = (select min([hours-per-week]) from Sheet1$) and [salary] = '>50K' 

--What country has the highest percentage of people that earn >50K?
select [native-country],
(count([native-country]) * 100) / (select count([native-country]) from Sheet1$ where salary = '>50K') as percentage_country
from Sheet1$
group by [native-country]
order by [percentage_country] desc

--Identify the most popular occupation for those who earn >50K in India.

select occupation
from Sheet1$
where [native-country] = 'India' and salary = '>50K'