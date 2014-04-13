$(document).ready( function() {

	$("[name='nolike']").click(function() {
		$(this).parent().parent().parent().parent().fadeOut();
	});

});