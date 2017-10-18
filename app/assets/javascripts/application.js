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
//= require popper
//= require jquery
//= require inputmask
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

// Activated datetimepicker
$(function() {
  $.datetimepicker.setLocale('pt-BR');

  $('.datetimepicker_appointment').datetimepicker({
    format: 'd/m/Y H:i',
    startDate: new Date()
  });

  $('.datetimepicker_birth').datetimepicker({
    format: 'd/m/Y',
    startDate: new Date(),
    timepicker: false
  });
});

$(document).ready(function() {
  $('.phone-input').inputmask("(99) 9{4,5}-9{4}");
  $('.crm-input').inputmask("9{4,10}/aa");
  $('.cpf-input').inputmask("9{3}.9{3}.9{3}-9{2}");
})