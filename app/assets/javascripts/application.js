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
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap/alert
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/es-ES
//= require_tree .

// Compatibilidad Jquery y Turnolinks 5
$(document).on('page:load', function(){
  window['rangy'].initialized = false;
});

// Cualquier Jquery arranca aquí
$(document).ready(function() {
});


// Eliminar data de Modal Window despues de cerrarlo
// Opción no documentada
$(document).on("hidden.bs.modal", function (e) {
    $(e.target).removeData("bs.modal").find(".modal-content").empty();
});
