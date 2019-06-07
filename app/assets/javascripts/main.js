$(document).ready(function(){
    $('#text_fly_from').autocomplete({
        source :$('#text_fly_from').data('autocomplete-source'),
        select: function( event, ui ){
            airportOrigin = ui.item.id;
        }
   });
});