$(document).ready( function() {

	// Fade out after a dislike button is clicked
	$("[name='nolike']").click(function() {
		$(this).parent().parent().parent().parent().fadeOut();
	});

	// Ajax button like 



});

// Like button Ajax call to ruby code 
function like_this_book() {
      alert("You clicked the LIKE button");
      
      $.post('/books/like_book'), {
      	book: 1,
      	user: 1
      }, 
      function(data) {
      	var out = data.result;
      	alert(out);
      	      }
 }