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
	<li>Book(ISBN, Quantity)</li>
	<li>Video(Title, Year, Quantity)</li>
	<li>BookCopy(ISBN [References Book], Item_ID [References Item])</li>
	<li>VideoCopy(Titulo, Año [References Video], Item_ID [References Item])</li>
	<li>Item(ID, Lost_Cost, Delay_Cost, Availability, State, Item_Type: boolean(Book-Video))</li>
	<li>Customer(ID, Name, Address, Phone_Number, Date_Sing_Up, User_Name, Password, Card_Number [References Card])</li>
	<li>Employee(ID, Name, Address, Phone_Number, User_Name, Password, Card_Number [References Card], Paycheck)</li>
	<li>Card(Number, Estado, Multas)</li>
	<li>Rent(Item_ID [References Item], Customer ID [References Item])</li>
	<li>Branch(Name, Address, Phone_Number, Media, Employee_ID [References Employee])</li>
</ul>