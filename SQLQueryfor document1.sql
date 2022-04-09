


create table documents(
id int not null primary key identity(1,1),
data varbinary(max),
extension char(5)

)

select * from documents