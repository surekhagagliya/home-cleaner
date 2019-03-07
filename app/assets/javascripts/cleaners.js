//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load',function(){
    cleanerValidation();
});
function cleanerValidation(){
    $('.cleaner_form').each(function(){
        $(this).validate({
            rules: {
                "cleaner[first_name]":{
                    required: true,
                    maxlength: 10,
                    minlength: 2
                },
                "cleaner[last_name]":{
                    required: true,
                    maxlength: 10,
                    minlength: 2
                },
                "cleaner[city_ids][]":{
                    required: true
                },
                "cleaner[quality_score]":{
                    required: true
                },
                "cleaner[phone_no]":{
                    required: true,
                    maxlength: 10
                },
            },
            messages: {
                "cleaner[first_name]":{
                    required: "Cleaner Name is Required",
                    maxlength: "Cleaner Name must be less than 10 character",
                    minlength: "Cleaner Name must be more than 2 character"
                }
            }
        });
    });
}
