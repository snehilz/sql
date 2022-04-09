use sanu


create table Users(
UserID int identity(1,1) primary key,
LoginName nvarchar (100) unique not null,
Password nvarchar (100) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
Position nvarchar (100) not null,
Email nvarchar(150)not null
) 


insert into Users values ('admin','admin','Snehil','Suman','Administrator','sumansanu44@gmail.com')
insert into Users values ('dinesh','abc123456','Dinesh','Kumar','Accounting','dk151271@gmail.com')
insert into Users values ('sneha','abc123456','Sneha','Rani','Receptionist','sumansanu44@gmail.com')

select * from Users

declare @user nvarchar(100)='admin'
declare @pass nvarchar(100)='admin'

