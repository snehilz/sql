use sanu

create table events(

eventId int Identity(1,1) primary key clustered not null,
eventTitle nvarchar(100) not null,
eventDescription nvarchar(200) not null,
startDate date not null,
endDate date not null,
avenue nvarchar(200) not null,
maxMembers int not null
)

select * from events

insert into events(eventTitle,eventDescription,startDate,endDate,avenue,maxMembers)
values('first event','first event description','2020-11-04','2020-11-10','145 parkway bazar,uxp',1000)
,('second event','second event description','2021-07-04','2021-08-6','145 parkway bazar,uxp',2000)