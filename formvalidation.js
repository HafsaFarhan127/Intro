// onfocus event is when a user enters a field

// onblur event is when the user enters the value and has left or
// the user presses the tab to exit the field


// code for this in week9.html

function validatename(){
    let name=document.getElementById('nameid');
    let error=document.getElementById('oops');
    // here we pointed towards the element we didnt get the value so
    if (name.value==''){
        name.style.border="2px solid red";
        error.innerHTML='bad boi';
        error.style.color="red";
        return false;

    } else{
        // now if we wanna enter an inout again we dont want the borders
        // to still be red so the following code takes care of that
        
        // method called ischecked can see if box is checked
// for radio the name must be same
        return true;

        // in js and is && ; or is ||
    }
}

function showPass1(){
    let pass = document.getElementById('password1');
    let pass1 = document.getElementById('showPass1');
    if (pass1.checked){
        pass.setAttribute('type','text');
    }else{
        pass.setAttribute('type','password');
    }
    // this is for the show the password thingy check if its right figure out to change the text fields same logic as the tel to email field

}
function changefield(){
    // let displayEmail=document.getElementById('emailField');
    let optioncall=document.getElementById('pcid');
    let displayfield=document.getElementById('telfield');
    if(optioncall.checked){
		displayfield.style.visibility='visible';
        // displayEmail.style.visibility='hidden';
    }else{
		displayfield.style.visibility='hidden';
		

    }

}


function field(){
let emailRadio = document.getElementById("email");
let phoneRadio = document.getElementById("phone");
let contactInfo = document.getElementById("contactInfo");

  if (emailRadio.checked) {
    contactInfo.innerHTML = `
      <label for="email-field">Email:</label>
      <input type="email" name="email-field" id="email-field">
    `;
   

  } else if (phoneRadio.checked) {
    contactInfo.innerHTML = `
      <label for="phone-field">Phone:</label>
      <input type="tel" name="phone-field" id="phone-field">
    `;
   
  }
};

function emptyfields(fieldID){
    let usernameinput=document.getElementById(fieldID);
    // this generalizes the function and i can use for any field as it fetches the value using the id
    let validinput;
    if (usernameinput.value == "") {
		usernameinput.style.border = "1px solid red";
		usernameinput.placeholder = "Please enter required info!";
		validinput = false;
	}else {
		usernameinput.style.border = " 1px solid black";
		usernameinput.placeholder = "";
		validinput = true;
	}
	return validinput;
	}