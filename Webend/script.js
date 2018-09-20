// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  console.log(scrolled)
  if (scrolled <80){
    document.getElementById("top-pill").style.top = 300-(scrolled)/2 + "px";
    document.getElementById("bottom-pill").style.top = 455+(scrolled)/2 + "px";
    document.getElementById("home-main-panel-text-actual").style.opacity = (20-scrolled)/20;
    document.getElementById("top-pill").style.opacity = 1;
    document.getElementById("bottom-pill").style.opacity = 1;
  }else{
    document.getElementById("top-pill").style.opacity = (90-scrolled)/10;
    document.getElementById("bottom-pill").style.opacity = (90-scrolled)/10;
    document.getElementById("base-label").style.opacity = (90-scrolled)/10;
    document.getElementById("cap-label").style.opacity = (90-scrolled)/10;
    document.getElementById("container-label").style.opacity = (90-scrolled)/10;

  }

  if (scrolled>15 && scrolled < 80){
    document.getElementById("base-label").style.opacity = (scrolled-15)/10;
    document.getElementById("cap-label").style.opacity = (scrolled-15)/10;
    document.getElementById("container-label").style.opacity = (scrolled-15)/10;
  }else if (scrolled<=15){
    document.getElementById("base-label").style.opacity = 0;
    document.getElementById("cap-label").style.opacity = 0;
    document.getElementById("container-label").style.opacity = 0;
  }
}
