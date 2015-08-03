$(document).ready(function(){
  $('.cart').mouseenter(function(){
    $(this).animate({
      width:  "+=10",
      height: "-=5"
    });
  });

  $('.cart').mouseleave(function(){
    $(this).animate({
      width:  "-=10",
      height: "+=5"
    });
  });
});