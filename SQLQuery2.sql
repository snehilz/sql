select * from userssele


select * from sysobjects where crdate>'2021-10-01'

select * from  Sheet1$

select city , sum(population) from  Sheet1$ group by city 

select country  , city ,sum(population) from  Sheet1$ where country like 'india%' 
group by country,city   order by country ,city 

select country   ,sum(population) from  Sheet1$ where country like 'india%' 
group by country   order by country 




270309635

