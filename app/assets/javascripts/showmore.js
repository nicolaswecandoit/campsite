$(document).ready(function() {

var button=document.getElementById("showmore");
var content=document.getElementById("moretext");
//Connecting button variable to on click function
button.onclick = function(){
  // If content class name is equal to open
  if(content.className=="open"){
    //removes class name
    content.className="";
    // once removed button shows show more
    button.innerHTML="voir plus"
     }else{
       //other wise if its closed  button will show show less
       content.className="open";
       button.innerHTML="voir moins"
     }
};
});