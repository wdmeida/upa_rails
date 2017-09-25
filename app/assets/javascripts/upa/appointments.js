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