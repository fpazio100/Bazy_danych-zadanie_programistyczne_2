/* procedura skladowa - zlicza premie dla wybranego pracownika w wybranym roku i dodaje ja jako dodatkowy wydatek */
create proc premia
@e_id int,
@year int,
@bonus money output
as
begin
	declare @hours_worked float;
	declare @n_projects int;
	declare @exp_id int;

	select @hours_worked = sum(datepart(hour, Duration) + convert(float, datepart(minute, Duration))/60)
	from WorkTimes
	where EmployeeID = @e_id and year(StartTime) = @year;

	select @n_projects = count(distinct ProjectID)
	from WorkTimes
	where EmployeeID = @e_id and year(StartTime) = @year;

	select @bonus = (0.1 + 0.1 * @n_projects) * @hours_worked * HourlyRate 
	from Employees
	where EmployeeID = @e_id;

	select @exp_id = count(*) + 1 from AdditionalExpenses;

	insert into AdditionalExpenses
	values (@exp_id, null, @bonus,concat('Premia dla pracownika o id ', @e_id, ' za rok ', @year), getdate());
end

