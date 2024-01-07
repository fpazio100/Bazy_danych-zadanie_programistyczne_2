/* Tworzenie bazy danych */

create database Zarzadzanie_projektami;

use Zarzadzanie_projektami;

create table Employees (
	EmployeeID int not null primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	HourlyRate money not null,
	Supervisor int
	constraint FK_Employees_Employees
		foreign key (Supervisor)
		references Employees(EmployeeID)
);

create table Projects (
	ProjectID int not null primary key,
	ProjectName nvarchar(50) not null,
	Description nvarchar(100) not null,
	ProjectLead int,
	constraint FK_Projects_Employees
		foreign key (ProjectLead)
		references Employees(EmployeeID)
		on update cascade
		on delete set null
);

create table AdditionalExpenses (
	ExpenseID int not null primary key,
	ProjectID int,
	Cost money not null,
	Description nvarchar(100),
	DateOfExpense datetimeoffset(7) not null,
	constraint FK_AdditionalExpenses_Projects
		foreign key (ProjectID)
		references Projects(ProjectID)
		on update cascade
		on delete cascade
);


create table WorkTimes (
	EmployeeID int not null,
	ProjectID int not null,
	StartTime datetimeoffset(7) not null,
	Duration time(7) not null,
	constraint FK_WorkTimes_Projects foreign key (ProjectID) references Projects(ProjectID),
	constraint FK_WorkTimes_Employees foreign key (EmployeeID) references Employees(EmployeeID)
);
