// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  console.log(scrolled)
  if (scrolled <70){
    document.getElementById("top-pill").style.top = 300-(scrolled)/2 + "px";
    document.getElementById("bottom-pill").style.top = 455+(scrolled)/2 + "px";
    document.getElementById("home-main-panel-text-actual").style.opacity = (20-scrolled)/20;
    $('#top-pill').removeClass('stick');
    $('#bottom-pill').removeClass('stick');
  }else{
    $('#top-pill').addClass('stick');
    $('#bottom-pill').addClass('stick');
    document.getElementById("top-pill").style.top = 300-(70)/2+700 + "px";
    document.getElementById("bottom-pill").style.top = 455+(70)/2+700 + "px";
  }
}
