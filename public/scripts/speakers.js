//Script that supports the talk submission form
$(function(){
	jQuery.validator.messages.required = "*"; 

	$('#talk_form').validate({
		invalidHandler: function(e, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				alert('Some fields are invalid, please fix them.');
			}
		}, 

		messages: {
			description: {
				required: " "
			},
			biography: {
				required: " "
			}
		}
	});

});