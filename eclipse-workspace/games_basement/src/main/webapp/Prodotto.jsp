<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.ArticoliBean"%>
<%@ page import="control.ProductServlet"%>
<%@ page import="dao.ArticoliDAO"%>
<%@ page import="implementation.ArticoliImpl"%>
<%@ page import="bean.RecensioneBean"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<script src="ajax/ajaxJSON.js"></script>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%ArticoliImpl a=new ArticoliImpl();
  ArticoliBean p=a.searchByCode(request.getParameter("id"));
 ArrayList<RecensioneBean> rb=a.getRecensioni(p);
%>
<title><%=p.getNome() %></title>
<script src="jQuery/jquery.js"></script>
<script src='jQuery/jquery-ui.min.js'></script>
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style><%@include file="css/Prodotto.css"%></style>
</head>
<body>
	<%@include file="Header2.jsp" %>
	<input type="hidden" id="codiceA" value=<%=p.getCodiceA()%>>
	<div id=tit-titpro>
		<p><b><%=p.getNome() %></b></p>
	</div>
	<div class="prodotto">
		<div class="prodotto1">
			<img class="pitcure" src="prodottiImg/<%=p.getNome() %>/1.jpg" alt="1" style="max-width:100%">
		
			<img class="pitcure" src="prodottiImg/<%=p.getNome() %>/2.jpg" alt="2" style="max-width:100%">
		
			<img class="pitcure" src="prodottiImg/<%=p.getNome() %>/3.jpg" alt="3" style="max-width:100%">
		
			<img class="pitcure" src="prodottiImg/<%=p.getNome() %>/4.jpg" alt="4" style="max-width:100%">
		
			<img class="pitcure" src="prodottiImg/<%=p.getNome() %>/5.jpg" alt="5" style="max-width:100%">
			
			<div style="display:inline">
			<button class="buttonleft" onclick="plusDivs(-1)">&#10094;</button>
			<button class="buttonright" onclick="plusDivs(1)">&#10095;</button>	
		</div> 
			
		</div>
		
		<div class="shop">
			<div class="shop1">
					<div class="shop2">
						<% if(p.isOfferta() == true){
							double r = p.getPrezzo();
							double ps = 0;
							double s = 15;
							ps = r * s / 100;
							ps = r - ps;%>
						<p style="margin-bottom:10px;text-decoration:line-through;"><%=p.getPrezzo() %>0&euro;</p>
						<p><%=ps %>&euro;</p>
						<%}else{ %>
						<p style="display:inline;"><%=p.getPrezzo() %>0&euro;</p>
						<%} %>
					</div>
					<div class="shop2">
						<p style="display:inline;">Quantit&agrave;&nbsp;<input id="quantita" class="n" type="number" min="1" max="99"></p>
					</div>
			</div>
			
			<div class="shop1">
				<div class="shop2">
					<%if(p.getQuantita()<=0){%>
						<button type="button" id="prenota" class="pnd">Prenota!</button>
					<%} %>
				</div>
				<div class="shop2">
					<% if(p.isOfferta() == true){%>
						<button class="off" type="button">&#127918;&nbsp;Prodotto in offerta</button>
					<%}else {%>
						<button class="noff" type="button">&#9888;&nbsp;Prodotto non in offerta</button>
					<%} %>
				</div>
			</div>
			
			<div class="shop1">
				<div class="shop2">
					<button id="carrello" class="bag" type="submit">Aggiungi al carrello</button>
				</div>
			</div>
		</div>
	</div>
		
		<hr class="line">
		
		<div>
			<div>
				<p class="d">DESCRIZIONE</p>
			</div>
			<div class="des">
				<p><%=p.getDescrizione() %></p>
			</div>
		</div>
		
		<div class="feed">
			
		</div>
		
		<div>
			<%if(rb.size()==0){%>
				<p><b>Non ci sono ancora recensioni,insersci la prima!</b></p>
			<%}else{ %>
				<table>
					<tr>
						<th>NumeroStelle</th>
						<th>Titolo</th>
						<th>Descrizione</th>
						<th>Utente</th>
					</tr>
				<% for(RecensioneBean t:rb){%>
					<tr>
						<td><%=t.getNumeroStelle() %></td>
						<td><%=t.getTitolo() %></td>
						<td><%=t.getDescrizione() %></td>
						<td><%=t.getIdUtente() %></td>						
					</tr>
				<%} %>
				</table>
			<%} %>
			<%UserBean usr=(UserBean)request.getSession().getAttribute("user"); 
			  if(usr==null){%>
				<a class="f" href="Register.jsp" id="feedLink">Scrivi una recensione</a>
			<%}else{ %>
				<a class="f" href="Feedback.jsp?id=<%=request.getParameter("id")%>" id="feedLink">Scrivi una recensione</a>
			<%} %>
		</div>
		
		<div style="margin-top: 25px;">
			<%@include file="Footer.jsp"%>
		</div>
		
		<form action="Feedback.jsp" method="get" id="feedback">
			
		</form>

<!-- ajax -->		
<script>
	$("#carrello").click(function(){
		var quantita=document.getElementById("quantita");
		var codiceA=document.getElementById("codiceA");
		
		if(quantita.value.trim()<=0){
			alert("Inserire una quantita desiderata");
		}
		
		compra(codiceA.value.trim(),quantita.value.trim());
	});

	function readJson(listJson){
		var json = JSON.parse(listJson) 
		var result=json.cartInfo;
		
		if(result=="prodotto aggiunto"){
			alert("Prodotto inserito");
		}else{
			alert("Prodotto non inserito,riprovare");
		}
	}
	
	function compra(param,param2){
		var id="quantita";
		var url="/games_basement/AjaxCart";
		var timeout=0;
		
		ajaxCall(id, url, readJson, param, param2, timeout);
	}
	
</script>

<script type="text/javascript">
	const form = document.getElementById('carrello');
		
	form.addEventListener('submit',(event) => {
			
	});
		
	form.addEventListener('submit'),(event) =>{
			event.preventDefault();
	});
	
</script>

<script type="text/javascript">
	const form = document.getElementById('acquista');
		
	document.getElementById("prenota").onclick(fucntion(){
				
	});
	
	form.addEventListener('submit',(event) => {
			
	});
		
	form.addEventListener('submit'),(event) =>{
			event.preventDefault();
	});
</script>

<script type="text/javascript">
	var slideIndex = 1;
	showDivs(slideIndex);

	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}

	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("pitcure");
	  if (n > x.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	 
</script>
	
<script>
//apply user rating to all displays
//add star ratings to an array
var starRating = document.querySelectorAll(".fa-star"),
ratingTotal = document.querySelectorAll(".rating-total");

//convert ratingTotal HTMLCollection to array and reverse its order (5 star <-> 1 star)
var reverseRatingTotal = Array.from(ratingTotal).reverse();

//display initial rating totals
displayTotals();

//use event listener to record changes to user rating
starRating.forEach(function(star) {
star.addEventListener("click", recordRating);
})

function recordRating(event) {
// use indexOf to identify selected user rating
var userRating = Array.from(starRating).indexOf(event.target);

// define selected rating to adjust display totals
var selectedIndex;

starRating.forEach(function(item, index) {
 // add or remove .active class based upon selected user rating
 if (index < userRating + 1) {
   starRating[index].classList.add("active");
   selectedIndex = index;
 } else {
   starRating[index].classList.remove("active");
 }

 displayTotals(selectedIndex);
});
}

//display star rating totals from html custom data-
function displayTotals(selectedIndex) {
var barChart = document.querySelectorAll(".bar"),
 displaySummary = document.querySelectorAll(".summary"),
 numRatings = 0,
 numRatingsValue = 0;

// convert barChart HTMLCollection to array and reverse its order (5 star <-> 1 star)
var reverseBarChart = Array.from(barChart).reverse();

reverseRatingTotal.forEach(function(total, index) {
 if (index == selectedIndex) {
   // add selected rating to display total
   total.innerHTML = (parseInt(total.getAttribute("data-rating-count")) + 1);
   // adjust selected bar width
   reverseBarChart[index].style.width = (((parseInt(total.getAttribute("data-rating-count")) + 1) / 20) * 100) + "%";
 } else {
   // display unselected totals
   total.innerHTML = total.getAttribute("data-rating-count");
   // adjust unselected bar widths
   reverseBarChart[index].style.width = ((total.getAttribute("data-rating-count") / 20) * 100) + "%";
 }
 // count total number and value of ratings
 numRatings += parseInt(total.innerHTML);
 numRatingsValue += (parseInt(total.innerHTML) * (index + 1));
});

// display rating average and total
ratingsAverage = (numRatingsValue / numRatings).toFixed(2);
displaySummary[0].innerHTML = ratingsAverage + " average based on " + numRatings + " reviews.";
}

</script>

</body>
</html>