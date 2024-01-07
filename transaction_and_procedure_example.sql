/* Transakcja maj�ca na celu:
- sprawdzenie ile przepracowa� ka�dy z pracownik�w;
- da� podwy�k� pracownikowi, kt�ry przepracowa� najwi�cej godzin;
- doda� dodatkowy wydatek do tabeli additional expenses*/

begin transaction

-- patrzymy ile godzin przepracowa� ka�dy z pracownik�w
select EmployeeID, datepart(hour, Duration) + convert(float, datepart(minute, Duration))/60 as HourWorked
	from WorkTimes;

-- zwi�kszamy stawk� godzinow� pracownikowi, kt�ry przepracowa� najwi�ksz� liczb� godzin w obecnym roku
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
values (7, 3, 2513.57,'No�e i deski do krojenia', '2025-02-01 00:00:00.0000000 +01:00')

if @@ERROR != 0 rollback;
commit;


/* przyk�adowe wywo�anie procedury premia */
declare @bonus money;
exec premia @e_id = 1, @year =2024, @bonus = @bonus output;
print @bonus;

declare @bonus money;
exec premia @e_id = 5, @year =2025, @bonus = @bonus output;
print @bonus;
