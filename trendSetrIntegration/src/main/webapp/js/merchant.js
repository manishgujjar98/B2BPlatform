$(document).ready(function() {
		  $('.toggle-menu').click(function(e) {
		    e.preventDefault();

		    $('.sidebar-container').toggleClass('open');
		  });
		        
		    $('.menu-close').click(function(e){
		                      e.preventDefault();
		        $('.sidebar-container').removeClass('open');
		                      });

		});