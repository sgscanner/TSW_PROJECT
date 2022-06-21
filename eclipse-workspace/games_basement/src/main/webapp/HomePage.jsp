<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
<!--<link rel="icon" type="image/x-icon" href="/images/logo.ico">
<link rel="stylesheet" href="css/HomePage.css">
  -->
<style>
* {
	box-sizing: border-box
}

body {
	font-family: Verdana, sans-serif;
	margin: 0
}

.mySlides {
	display: none
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 95%;
	position: relative;
	margin: auto;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	background-color:red;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

.prodotti {
  display: inline-block;
  gap: 2px;
  margin-top:15%;
  margin-bottom:10%;
}

.prodotto {
  background-color: white;
  color: black;
  border: 1px black solid;
  padding: 1rem;
  height: 15rem;
  width:15.5rem;
}

.image{
	border:solid black 1px;
	width:150px;
	height:150px;
	margin:auto;
	float:none;
	text-align:center;
	position:relative;
}

.prezzo{
	float:left;
}


/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
</style>

	<%@include file="Header2.jsp"%>
</head>
<body>
<%
	ArrayList<ArticoliBean> articoli = new ArrayList<ArticoliBean>();
	ArticoliImpl impl = new ArticoliImpl();
	articoli = impl.queryGetProduct(4);
%>

<br>
	<div class="slideshow-container">
		<div class="mySlides fade">
			<div class="numbertext"></div>
			<img src="img/banner2.jpg" style="width: 100%">
			<div class="text"></div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext"></div>
			<img src="img/banner3.jpg" style="width: 100%">
			<div class="text"></div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext"></div>
			<img src="img/banner4.jpg" style="width: 100%">
			<div class="text"></div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext"></div>
			<img src="img/banner5.jpg" style="width: 100%">
			<div class="text"></div>
		</div>
			<button class="prev" onclick="plusSlides(-1)">&#10094;</button>
			<button class="next" onclick="plusSlides(1)">&#10095;</button>
	</div><br>
	
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(2)"></span> 
		<span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span> 
		<span class="dot" onclick="currentSlide(5)"></span>
	</div>

<%for(int i=0; i<articoli.size();i++){%>										
<div class="prodotti">
	<div class="prodotto">
		<div id="prodotto1">
			<div class="image">
				<a id=<%=articoli.get(i).getCodiceA()%> onclick="goTo(this.id)">
					<img src="prodottiImg/<%=articoli.get(i).getNome()%>/rec.jpg" alt="Immagine non disponibile" width="150px" height="137px">
				</a>
			</div>
			<div class="txt">
				<h5><%=articoli.get(i).getNome()%></h5>
				<div class="prezzo">
				<h5><%=articoli.get(i).getPrezzo()%></h5>
				</div>
			</div>
		</div>		
	</div>
</div>
<%}%>				
<script>
        let slideIndex = 1;
        showSlides(slideIndex);
        
        function plusSlides(n) {
          showSlides(slideIndex += n);
        }
        
        function currentSlide(n) {
          showSlides(slideIndex = n);
        }
        
        function showSlides(n) {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          let dots = document.getElementsByClassName("dot");
          if (n > slides.length) {slideIndex = 1}    
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
        }
</script>
<script>
			function goTo(id){
				var path="Prodotto.jsp?id="+id;
				location.replace(path);
			}
		</script>
</body>
</html>