$(document).ready(function() {
  console.log("Running script");
  $("#item_category").bind("change", function(){
    value = ($("#item_category").val());
    if(value === "") {
      console.log(value);
      $("#hif").removeClass("hidden_input_field");
    } else {
      $("#hif").addClass("hidden_input_field");
    };
  });


  $('img.category_image').mouseenter(function() {
       $(this).animate({
           opacity: 0.5,
       });
       $( "#category_name" ).show();
   });
   $('img.category_image').mouseleave(function() {
       $(this).animate({
           opacity: 1,
       });
       $( "#category_name" ).hide();
   });

});