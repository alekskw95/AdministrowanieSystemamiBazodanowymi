select @@VERSION

--https://msftdbprodsamples.codeplex.com/downloads/get/165399

select * from HumanResources.Department;

select * from HumanResources.Employee

select * from Person.Person;

select p.BusinessEntityID, p.FirstName, p.LastName, e.BirthDate, e.Gender, e.JobTitle, 
d.DepartmentID, d.Name
from Person.Person p 
join HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
join HumanResources.EmployeeDepartmentHistory edh on edh.BusinessEntityID=e.BusinessEntityID
join HumanResources.Department d on d.DepartmentID=edh.DepartmentID
order by p.LastName


--Wyświetl nazwę produktu (Production.Product.Name), nazwę jego podkategorii (Production.ProductSubcategory.Name) oraz kategorii 
--(Production.ProductCategory.Name)

select p.Name, ps.Name, pc.Name
from Production.Product p 
join Production.ProductSubcategory ps on p.ProductSubcategoryID=ps.ProductSubcategoryID
join Production.ProductCategory pc on ps.ProductCategoryID=pc.ProductCategoryID;


--Wyświetl imię (Person.Person.FirstName) i nazwisko ((Person.Person.LastName)) najstarszego pracownika
--(data urodzenia jest w HumanResources.Employee.BirthDate)

select p.FirstName, p.LastName
from Person.Person p join HumanResources.Employee e on p.BusinessEntityID=e.BusinessEntityID
where e.BirthDate in (select min(e1.BirthDate)
					  from HumanResources.Employee e1);

					  
-- Wyświetl id pracowników (HumanResources.Employee.BusinessEntityID) 
-- i ich aktualną stawkę godzinową (HumanResources.EmployeePayHistory.Rate)

select e.BusinessEntityID, eph.Rate
from HumanResources.Employee e 
join HumanResources.EmployeePayHistory eph on e.BusinessEntityID=eph.BusinessEntityID
where eph.ModifiedDate in (select max(eph1.ModifiedDate)
							 from HumanResources.EmployeePayHistory eph1
							 where eph1.BusinessEntityID=eph.BusinessEntityID); 

--Wyświetl departamenty mające w nazwie literę 'r' na drugiej pozycji i 
--zatrudniające powyżej 50 osób.

select d.Name, count(e.BusinessEntityID) from 
HumanResources.Department d 
join HumanResources.EmployeeDepartmentHistory edh on edh.DepartmentID=d.DepartmentID
join HumanResources.Employee e on edh.BusinessEntityID=e.BusinessEntityID
where lower(d.Name) like '_r%'
group by d.Name
having count(e.BusinessEntityID)>50;


--Wyświetl pracowników (imię i nazwisko, stawka godzinowa), 
--których stawka godzinowa jest większa od 25.
--(Użyj tabel Person.Person, HumanResources.EmployeePayHistory)

select p.FirstName, p.LastName, eph.Rate 
from Person.Person p 
join HumanResources.EmployeePayHistory eph on eph.BusinessEntityID=p.BusinessEntityID
where eph.Rate>25;

--Wyświetl departamenty zatrudniające najmniej osób razem z liczbą ich pracowników.
select d.Name,COUNT(*)
from HumanResources.Department d join HumanResources.EmployeeDepartmentHistory edh
     on d.DepartmentID=edh.DepartmentID
group by d.Name
having COUNT(*) = (select min(c) from (select COUNT(*) c
                   from HumanResources.EmployeeDepartmentHistory
                   group by DepartmentID) tab)

--Wyświetl nazwy (Production.Product.Name), ceny (Production.Product.ListPrice) i
-- podkategorie produktów (Production.ProductSubcategory.Name),
-- które są najdroższe w swoich podkategoriach.

select p.Name, p.ListPrice, ps.Name
from Production.Product p 
join Production.ProductSubcategory ps on p.ProductSubcategoryID=ps.ProductSubcategoryID 
where p.ListPrice in (select max(p1.ListPrice)
from Production.Product p1
join Production.ProductSubcategory ps1 on p1.ProductSubcategoryID=ps1.ProductSubcategoryID
where ps.ProductSubcategoryID=ps1.ProductSubcategoryID); 


--Wyświetl historię zatrudnienia pracówników 
--(Person.Person.FirstName, Person.Person.LastName, HumanResources.DepartmentName, ),
-- których zatrudniano co najmniej dwukrotnie 

select p.FirstName, p.LastName, d.Name
from person.Person p 
join HumanResources.EmployeeDepartmentHistory edh on p.BusinessEntityID=edh.BusinessEntityID
join HumanResources.Department d on d.DepartmentID=edh.DepartmentID
group by p.FirstName, p.LastName, d.Name
having count(p.BusinessEntityID)>1;
 

--Zwiększ o 10 liczbę godzin wakacyjnych (HumanResources.Employee.VacationHours) pracownikom, 
--którzy przebywali 
--na zwolnieniu najmniejszą ilość godzin (HumanResources.Employee.SickLeaveHours)

update HumanResources.Employee set HumanResources.Employee.VacationHours = HumanResources.Employee.VacationHours + 10
where BusinessEntityID in (select BusinessEntityId from HumanResources.Employee
where HumanResources.Employee.SickLeaveHours in (
select min(e.SickLeaveHours) from HumanResources.Employee e))

--Zwiększ o 10 procent cenę produktów (Production.Product.ListPrice) z podkategorii 'Chains'

update Production.Product set ListPrice = ListPrice * 1.1 where ProductID in (
select p.ProductID
from Production.Product p
join Production.ProductSubcategory ps on ps.ProductSubcategoryID=p.ProductSubcategoryID
where ps.Name='Chains')
;
