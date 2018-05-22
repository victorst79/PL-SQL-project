# PL-SQL-project
PL / SQL Project based on a library's database.

<img src="https://i.imgur.com/c0NVbry.png">

<h3>Normalization</h3>
<ul>
	<li><b>CARD</b> (<i>Number</i>, Fines, Status)</li>
	<li><b>CUSTOMER</b> (<i>ID</i>, Name, Address, Phone_number, Card_number [References CARD(Number)], Password, User_name, Date_sign_up)</li>
	<li><b>EMPLOYEE</b> (<i>ID</i>, Name, Address, Phone_number, Card_number [References CARD(Number)], Password, User_name, Paycheck, Branch_name [References BRANCH(Name)])</li>
	<li><b>BRANCH</b> (<i>Name</i>, Address [References LOCATION(Address)], Phone_number)</li>
	<li><b>LOCATION</b> (Address)</li>
	<li><b>RENT</b> (<i>Card_ID [References CARD(Number)], Item_ID [References BOOK or VIDEO(ID)]</i>, Date, Return_date)</li>
	<li><b>BOOK</b> (<i>ISBN, ID</i>, State, Avalability, Deby_cost, Lost_cost, Address [References LOCATION(Address)])</li>
	<li><b>VIDEO</b> (<i>Title, Year, ID</i>, State, Avalability, Deby_cost, Lost_cost, Address [References LOCATION(Address)])</li>
</ul>