// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require datetimepicker
//= require jquery_ujs
//= require tether
//= require bootbox
//= require bootstrap
//= require notifyjs
//= require_tree .

/* Sobrescreve data-confirm do Rails. */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            className: 'btn-success'
        },
        cancel: {
            label: 'Não',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}

// // Activated datepicker
// $(function() {
//   $('.datepicker').datepicker();
// });

// Activated datetimepicker
$(function() {
  $.datetimepicker.setLocale('pt-BR');

  $('.datetimepicker_datenow').datetimepicker({
    format: 'd/m/Y',
    startDate: new Date(),
    timepicker: false
  });

  $('.datetimepicker_timenow').datetimepicker({
    format: 'H:i',
    datepicker: false    
  });

  $('.datetimepicker_birth').datetimepicker({
    format: 'd/m/Y',
    startDate: new Date(),
    timepicker: false
  });
});