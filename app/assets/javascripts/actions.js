$(document).ready( function() {

	// Fade out after a dislike button is clicked
	$(".btn-danger").click(function() {
		$(this).parent().parent().parent().parent().fadeOut();
	});
});

