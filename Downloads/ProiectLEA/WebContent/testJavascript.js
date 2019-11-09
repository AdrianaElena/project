/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var links = document.getElementsByTagName("a");
var link2 = document.getElementsByClassName("nav-link");

for(j=0; j<link2.length; j++){
    
}

for(i=0; i<links.length; i++){
    links[i].className = "link-" + i;
}

function getAverage(a, b){
    
    var average = (a + b) /2;
    console.log(average);
    return average;
}

var myResult = getAverage(7,12);
console.log("the average is " + myResult);

//video 22
var a = "7";
var b = 5;
console.log(a + b);
console.log(typeof(a + b)); //return the type of result

console.log( Math.round(7.5));


var a = "hello";
var b = 5;

if(!isNaN(a)){
    console.log("the result is " + (a * b));
    
}else{
    console.log("that int even a number");
}


//video 24

var myString  = 'I\'m a "fun" ninja string';

console.log(myString.indexOf("string"));

if(myString.indexOf("ninja") === -1){
    console.log("the word ninja is not in the string");
    
}else{
    console.log("the word ninja starts at position " + myString.indexOf("ninja"));
}

//var string1 = "abc";
//var string2 = "ABC";

//console.log(string1.toLowerCase() === string1);


var string1 = "abc";
var string2 = "bcd";

console.log(string1 < string1);



//video 28

var mycar = new Object();
mycar.maxSpeed = 50;
mycar.driver = "Shaun";

mycar.drive = function(){ console.log("now driving");};

mycar.drive();

console.log(mycar.driver);

var mycar2 = {
    maxSpeed: 50, 
    driver: "Ninja", 
    drive: function(speed, time){ 
        console.log(speed * time);
    }
};

console.log(mycar2.maxSpeed);
mycar2.drive(50, 3);



//video 29

var mycar2 = {
    maxSpeed: 50, 
    driver: "Ninja", 
    drive: function(speed, time){ 
        console.log(speed * time);
    },
    test: function(){
        console.log(this);
    },
    logDriver: function(){
        console.log("driver name is " + this.driver);
    }
};

console.log(mycar2.maxSpeed);
mycar2.drive(50, 3);
mycar2.test();
mycar2.logDriver();



//video 30
var mycar = {
    maxSpeed: 70, 
    driver: "Ninja", 
    drive: function(speed, time){ 
        console.log(speed * time);
    },
    test: function(){
        console.log(this);
    },
    logDriver: function(){
        console.log("driver name is " + this.driver);
    }
};

var Car = function (maxSpeed, driver){
    this.maxSpeed = maxSpeed;
    this.driver  =driver;
    this.drive = function(speed, time){ 
        console.log(speed * time);
    }
    this.logDriver = function(){
        console.log("driver name is " + this.driver);
    }
}

var myCar = new Car(50, "ade");
var myCar1 = new Car(70, "ninja man");
var myCar2 = new Car(30, "shaun");

myCar.drive(30, 5);
myCar.logDriver();




//video 31

var mydate = new Date();

console.log(mydate);

var myPastDate = new Date(1545, 11, 2, 10, 30, 15);
var myFutureDate = new Date(2515, 0, 31, 10, 30, 15);

console.log(myPastDate);
console.log(myFutureDate);

var brtday  = new Date(1985, 0, 15, 11, 15, 25);

console.log(brtday.getMonth());





















