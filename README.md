# PL-SQL-project
PL / SQL Project based on a library's database.

<h3>Tables</h3>
<ul>
	<li>Customers(ID[PK],Name,Addres,Phone_Number,Date_SingninUp,User_Name,Password,Card)</li>
	<li>Book(ID[PK],ISBN,Lost_Cost,Delay_Cost,Location,Availability,State,Quantity)</li>
	<li>Video(ID[PK],Tittle,Age,Location,Lost_Cost,Delay_Cost,Availability,State,Quantity)</li>
	<li>Cards(ID[PK],Fines,State)</li>
	<li>Branch(Name[PK],Addres,Phone_Number,Media,Employees)</li>
	<li>Employees(ID[PK],Name,Addres,Phone_Number,User_Name,Password,Card,Paycheck)</li>
</ul>

<img src="https://raw.githubusercontent.com/victorst79/PL-SQL-project/master/img/library.png">

<h3>Normalization</h3>
<ul>
	<li><b>CARD</b> (<u>ID</u>, Fines, Status)</li>
	<li><b>CUSTOMER</b> (<u>ID</u>, Name, Address, Phone_number, Card_number [References CARD(Number)], Password, User_name, Date_sign_up)</li>
	<li><b>EMPLOYEE</b> (<u>ID</u>, Name, Address, Phone_number, Card_number [References CARD(Number)], Password, User_name, Paycheck, Branch_name [References BRANCH(Name)])</li>
	<li><b>BRANCH</b> (<u>Name</u>, Address [References LOCATION(Address)], Phone_number)</li>
	<li><b>LOCATION</b> (Address)</li>
	<li><b>RENT</b> (<u>Card_ID [References CARD(Number)],Item_ID [References BOOK or VIDEO(ID)]</u>, Date, Return_date)</li>
	<li><b>BOOK</b> (<u>ISBN, ID</u>, State, Avalability, Deby_cost, Lost_cost, Address [References LOCATION(Address)])</li>
	<li><b>VIDEO</b> (<u>Title, Year, ID</u>, State, Avalability, Deby_cost, Lost_cost, Address [References LOCATION(Address)])</li>
</ul>