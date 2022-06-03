<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<style><%@include file="css/Header.css" %></style>
</head>

   <body>
        <div class="header">
            <nav>
                <img src="img/logo.png" class="logo">
                <form class="form">
                    <input type="text" placeholder="Search..." id="input" list="languages" autocomplete="off">
                    <datalist id="languages">
  <option value="PHP" />
  <option value="C++" />
  <option value="Java" />
  <option value="Ruby" />
  <option value="Python" />
  <option value="Go" />
  <option value="Perl" />
  <option value="Erlang" />
</datalist>
                    <input type="submit" value="Search">
                </form>	
                <ul class="nav-links">
                    <li><a href="Login.jsp">Accedi</a></li>
                    <li><a href="Register.jsp">Registrati</a></li>
                    <li><img src="img/carrello.jpg" class="carrello"></li>
                </ul>
            </nav>
             <ul class="first">
                <li><a href="">Home</a></li>
                <li><a href="">Contatti</a></li>
                <li><a href="">PlayStation</a></li>
                <li><a href="">Xbox</a></li>
                <li><a href="">Nintendo</a></li>
            </ul>
        </div>
        
        <div style="height: 10px;"></div>
<script>
let names = [
	  "Ayla",
	  "Jake",
	  "Sean",
	  "Henry",
	  "Brad",
	  "Stephen",
	  "Taylor",
	  "Timmy",
	  "Cathy",
	  "John",
	  "Amanda",
	  "Amara",
	  "Sam",
	  "Sandy",
	  "Danny",
	  "Ellen",
	  "Camille",
	  "Chloe",
	  "Emily",
	  "Nadia",
	  "Mitchell",
	  "Harvey",
	  "Lucy",
	  "Amy",
	  "Glen",
	  "Peter",
	];
	//Sort names in ascending order
	let sortedNames = names.sort();

	//reference
	let input = document.getElementById("input");

	//Execute function on keyup
	input.addEventListener("keyup", (e) => {
	  //loop through above array
	  //Initially remove all elements ( so if user erases a letter or adds new letter then clean previous outputs)
	  removeElements();
	  for (let i of sortedNames) {
	    //convert input to lowercase and compare with each string

	    if (
	      i.toLowerCase().startsWith(input.value.toLowerCase()) &&
	      input.value != ""
	    ) {
	      //create li element
	      let listItem = document.createElement("li");
	      //One common class name
	      listItem.classList.add("list-items");
	      listItem.style.cursor = "pointer";
	      listItem.setAttribute("onclick", "displayNames('" + i + "')");
	      //Display matched part in bold
	      let word = "<b>" + i.substr(0, input.value.length) + "</b>";
	      word += i.substr(input.value.length);
	      //display the value in array
	      listItem.innerHTML = word;
	      document.querySelector(".list").appendChild(listItem);
	    }
	  }
	});
	function displayNames(value) {
	  input.value = value;
	  removeElements();
	}
	function removeElements() {
	  //clear all the item
	  let items = document.querySelectorAll(".list-items");
	  items.forEach((item) => {
	    item.remove();
	  });
	}
</script>
</body>
</html>