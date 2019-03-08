//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load',function(){
    cityValidation();
});
function cityValidation(){
    $('.city_form').each(function(){
        $(this).validate({
            rules: {
                "city[name]":{
                    required: true,
                    maxlength: 50,
                    minlength: 2
                }
            },
            messages: {
                "city[name]":{
                    required: "City Name is Required",
                    maxlength: "City Name must be less than 50 character",
                    minlength: "City Name must be more than 2 character",
                }
            }
        });
    });
}
