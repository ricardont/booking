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
  $("#date_from_cont").datepicker({ 
    format: 'dd/mm/yyyy',
    autoclose: true, 
    todayHighlight: true,
    startDate: new Date()  
  });
  $("#date_to_cont").datepicker({ 
    format: 'dd/mm/yyyy',
    autoclose: true, 
    todayHighlight: true,
    startDate: new Date()  
  });
  $("#search_form").on ("ajax:success", flights_results)
  function flights_results(event, data){
    $("#results").append(data)
  }
});

