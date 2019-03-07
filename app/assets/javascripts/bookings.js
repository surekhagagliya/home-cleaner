//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load',function(){
    bookingValidation();
});
function bookingValidation(){
    $('.booking_form').each(function(){
        $(this).validate({
            rules: {
                "booking[city_id]":{
                    required: true
                },
                "booking[cleaner_id]":{
                    required: true
                },
                "booking[booking_date]":{
                    required: true
                }
            }
        });
    });
}
