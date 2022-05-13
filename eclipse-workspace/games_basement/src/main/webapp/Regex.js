/**
 * 
 */
function validateTelefono() {
	var reg = "/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/";

	if (document.regForm.phone.match(reg)) {
		return (true)
	} else {
		alert("Inserisci un numero di telefono corretto.")
	}
}

function validateEmail(mail) {
	var reg = "/\w+@\w+\.\w{2,4}/i";
	if (mail.match(reg)) {
		return (true)
	} else {
		alert("Inserisci una email valida.")
		return (false)
	}
}

function validatePassword(password) {
	var specialChars="/[A-z][]!.?#*]+/"
	//verifico se l'utente non ha inserito una password  
	if (password == "") {
		alert("Inserisci una password!")
		return false
	}
	//verifico se la password ha almeno 8 caratteri
	if(password.lenght<8){
		alert("Password troppo corta,deve avere almeno 8 caratteri")
		return false
	}
	if(!password.match(specialChars)){
		alert("La password deve contenere almeno 1 di questi caratteri:!.?#*")
	}
}

function matchPassword(password,password1){
	if(password!=password1){
		alert("Le password non corrispondono")
	}
}

export function validateTelefono(input){
	
}
