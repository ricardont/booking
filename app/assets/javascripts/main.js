$(document).ready(function(){
   function autocomplete_airports(element){
   	    $(element + '_visible').autocomplete({
        	source: $(element + '_visible').data('autocomplete-source'), 
        	select: function( event, ui ) {
        		$(element).val(ui.item.id); 
        	}
   		});
   }
   autocomplete_airports('#fly_from');
   autocomplete_airports('#fly_to');
});