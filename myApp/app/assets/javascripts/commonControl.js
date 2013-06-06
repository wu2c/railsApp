function showDay(){
	   var d = new Date();
	   var y = d.getFullYear();
	   var m = d.getMonth();
	   var day = d.getDate();
	   day = checkIncrement(day);
	   var t = d.getDay();
	   var weekday = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
	   var month = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun" ,"Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
	   document.getElementById("showday").innerHTML=weekday[t] + " "+ day+ " " + month[m] + " " + y;
}
	
function startT(){
	   var d = new Date();
	   var m = d.getMinutes();
	   var s = d.getSeconds();
	   var h = d.getHours();
	   m = checkIncrement(m);
	   s = checkIncrement(s);
	   document.getElementById("showtime").innerHTML = h+" :"+ m +", ";
	   var st = setTimeout("startT()",500);
}
	
function checkIncrement(i){
	if(i < 10)
	{
	     i = "0" + i;
	 }
	   return i;
}
