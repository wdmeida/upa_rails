jQuery(function() {
  var doctors = $('#appointment_doctor_id').html();
  
  return $('#appointment_specialization_id').change(function() {
    var specialization, options;
  
    specialization = $('#appointment_specialization_id :selected').text();
    options = $(doctors).filter("optgroup[label=" + specialization + "]").html();
  
    if (options) {
      return $('#appointment_doctor_id').html(options);
    } else {
      return $('#appointment_doctor_id').empty();
    }
  });
});

// Disabling form submissions if there are invalid fields
(function() {
  "use strict";
  window.addEventListener("load", function() {
    var form = document.getElementById("form-appointment");
    form.addEventListener("submit", function(event) {
      if (form.checkValidity() == false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add("was-validated");
    }, false);
  }, false);
}());