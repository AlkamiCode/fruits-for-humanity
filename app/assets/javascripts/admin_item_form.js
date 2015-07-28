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


  $('input[type="radio"]').click(function() {
  // $("input#item_not_available_status").prop("checked", true);
    });
});