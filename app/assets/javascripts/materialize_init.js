$(document).ready(function() {
    //Atualiza os campos dos formulários.
    Materialize.updateTextFields();

    //Inicializa o select do materialize
    $('select').material_select();

    //Inicializa o side nav.
    $(".button-collapse").sideNav();
});