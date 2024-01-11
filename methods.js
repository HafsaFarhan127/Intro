// here we dont need to import math because math is an obejct itself which takes porperties


let result=Math.PI;
// all our trials are gonna be in the console also these properties are case-sensitive



result=Math.random();
// also random by default generates random numbers between 1% and 99%

result=Math.floor(4.8); 
// answer should be 4


result=Math.ceil(4.8); 
// answer should be 5


let datedemo=new Date();
// when we declare months and day we start numbering from 0-11;but the date starts from 1;and the hr format is 24hrs

function showdate()
{let date=document.getElementById('rizz');
date.innerHTML=new Date();
};





console.log(result);