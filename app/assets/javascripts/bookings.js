//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load',function(){
    bookingValidation();
    $('.datetime_picker').click(function(){
        $(this).datetimepicker({
            minDate:moment(),
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down"
            },
            inline: true,
            sideBySide: true,
            format: 'DD/MM/YYYY hh:mm'
        });
    });
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
