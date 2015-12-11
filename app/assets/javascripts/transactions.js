/*
http://jessepollak.github.io/card/
*/

$( document ).ready(function() {
	$('form').card({
		container: '.card-wrapper',
		formSelectors: {
			nameInput: '#cc_first_name, #cc_last_name',
			numberInput: '#cc_number',
			expiryInput: '#cc_expiry',
			cvcInput: '#cc_cvc'
		}
	});
});