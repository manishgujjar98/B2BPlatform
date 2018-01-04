var wow = new WOW(
  {
    boxClass:     'wow',      // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset:       0,          // distance to the element when triggering the animation (default is 0)
    mobile:       true,       // trigger animations on mobile devices (default is true)
    live:         true,       // act on asynchronously loaded content (default is true)
    callback:     function(box) {
      // the callback is fired every time an animation is started
      // the argument that is passed in is the DOM node being animated
    },
    scrollContainer: null // optional scroll container selector, otherwise use window
  }
);
wow.init();

$(document).ready(function() {
	$('#shop-category .owl-carousel').owlCarousel({
		loop:false,
		margin:5,
		nav:true,
		dots:false,
		navText:['<i class="material-icons">chevron_left</i>','<i class="material-icons">chevron_right</i>'],

		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});
	$('#product-category .owl-carousel').owlCarousel({
		loop:false,
		margin:5,
		nav:true,
		dots:false,
		navText:['<i class="material-icons">chevron_left</i>','<i class="material-icons">chevron_right</i>'],

		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});
	$('#collection-category .owl-carousel').owlCarousel({
		loop:false,
		margin:5,
		nav:true,
		dots:false,
		navText:['<i class="material-icons">chevron_left</i>','<i class="material-icons">chevron_right</i>'],

		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});
});

	$(window).bind('scroll', function() {
		    var navHeight = $( '#user-feed' ).height() - $('#header').height() - $('.feed-strip').height();
		    if ($(window).scrollTop() > navHeight) {
		        $('.feed-strip').addClass('fixed-top');
		    }
		    else {
		          $('.feed-strip').removeClass('fixed-top');
		    }
		});


// prevents modal being closed from either esc key or clicked outside the modal box to all 
// modal boxes
