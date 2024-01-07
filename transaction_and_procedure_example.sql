/* Transakcja maj¹ca na celu:
- sprawdzenie ile przepracowa³ ka¿dy z pracowników;
- daæ podwy¿kê pracownikowi, który przepracowa³ najwiêcej godzin;
- dodaæ dodatkowy wydatek do tabeli additional expenses*/

begin transaction

-- patrzymy ile godzin przepracowa³ ka¿dy z pracowników
select EmployeeID, datepart(hour, Duration) + convert(float, datepart(minute, Duration))/60 as HourWorked
	from WorkTimes;

-- zwiêkszamy stawkê godzinow¹ pracownikowi, który przepracowa³ najwiêksz¹ liczbê godzin w obecnym roku
with hw as (
	select EmployeeID, sum(datepart(hour, Duration) + convert(float, datepart(minute, Duration))/60) as HourWorked
	from WorkTimes
	where year(StartTime) = year(getdate())
	group by EmployeeID
)
update Employees
	set HourlyRate = HourlyRate*1.1
	from Employees
	where EmployeeID = (
		select EmployeeID from hw
		where HourWorked = (
			select max(HourWorked)
			from hw
		)
	);

if @@ERROR != 0 rollback;

-- wstawiamy dodatkowy wydatek

insert into AdditionalExpenses
values (7, 3, 2513.57,'No¿e i deski do krojenia', '2025-02-01 00:00:00.0000000 +01:00')

if @@ERROR != 0 rollback;
commit;


/* przyk³adowe wywo³anie procedury premia */
declare @bonus money;
exec premia @e_id = 1, @year =2024, @bonus = @bonus output;
print @bonus;

declare @bonus money;
exec premia @e_id = 5, @year =2025, @bonus = @bonus output;
print @bonus;
