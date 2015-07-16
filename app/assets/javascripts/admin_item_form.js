$(document).ready(function() {
  console.log("Running script");
  $("#admin_category").bind("change", function(){
    value = ($("#admin_category").val());
    if(value === "") {
      console.log(value);
      $("#hif").removeClass("hidden_input_field");
    } else {
      $("#hif").addClass("hidden_input_field");
    };
  });
});