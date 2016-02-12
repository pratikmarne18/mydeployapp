// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery_nested_form
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require turbolinks
//= require_tree .


$(document).bind('page:change',function(){ 
  album_form();
  image_form();
});

function album_form() {
	$('#album_form').validate({
		rules : {
			'album[name]' : {
				required : true
			},
		},
		messages : {
			'album[name]' : {
				required : 'Please enter Album name'
			},
		},
		errorPlacement : function(error, element) {
			error.insertAfter(element);
		}
	});
}

function image_form() {
	$('#image_form').validate({
		rules : {
			'image[name]' : {
				required : true
			},
			'image[tag_line]' : {
				required : true
			},
			'image[image]' : {
				required : true
			}
		},
		messages : {
			'image[name]' : {
				required : 'Please enter image name'
			},
			'image[tag_line]' : {
				required : 'Please enter image tag line'
			},
			'image[image]' : {
				required : ''
			}
		},
		errorPlacement : function(error, element) {
			error.insertAfter(element);
		}
	});
}


$(function() {
	var fieldsCount, maxFieldsCount = 24, $addLink = $('a.add_nested_fields');

	function toggleAddLink() {
		$addLink.toggle(fieldsCount <= maxFieldsCount);
	}

	$(document).on('nested:fieldAdded', function() {
		fieldsCount += 1;
		toggleAddLink();
	});

	$(document).on('nested:fieldRemoved', function() {
		fieldsCount -= 1;
		toggleAddLink();
	});

	fieldsCount = $('form .fields').length;
	toggleAddLink();
});
