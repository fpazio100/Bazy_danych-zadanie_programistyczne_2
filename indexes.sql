/* Dodawanie indexów do tabel */

create nonclustered index IX_LastName_FirstName
on Employees(LastName, FirstName);

create nonclustered index IX_ProjectName
on Projects(ProjectName);

create nonclustered index IX_ProjectID
on AdditionalExpenses(ProjectID);

create nonclustered index IX_DateOfExpense
on AdditionalExpenses(DateOfExpense asc);

create clustered index IX_EmployeeID_ProjectID
on WorkTimes(EmployeeID, ProjectID);

create nonclustered index IX_StartTime
on WorkTimes(StartTime asc);
