$(document).ready(function () {
	$(document).foundation();

	$('.main-nav-toggle').click(function () {
		$('body').toggleClass('no-scroll');
		$('header nav.main').fadeToggle(600);
		$(this).toggleClass('on');

		if($(this).hasClass('on')) {
			$(this).find('span.action').html($('span.action', this).data('close'));
		} else {
			$(this).find('span.action').html($('span.action', this).data('open'));
		}

		return false;
	});

	$('header nav.main a').click(function(){
		if($('.main-nav-toggle').is(':visible')) {
			var sibling = $(this).next('ul');
			if(sibling.length) {
				if(!sibling.is(':visible')) {
					sibling.slideDown();
					return false;
				}
			}
		}
	});

	$('.fancybox').fancybox();

	if(!Modernizr.input.placeholder){
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
			}
		}).blur(function() {
			var input = $(this);
			if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				input.val(input.attr('placeholder'));
			}
		}).blur();
	
		$('[placeholder]').parents('form').submit(function() {
			$(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
					input.val('');
				}
			});
		});
	}
});

$(window).resize(function(){
	if(!$('.main-nav-toggle').is(':visible')) {
		$('header nav.main').css('display', '');
		$('.main-nav-toggle').removeClass('on');
	}
});