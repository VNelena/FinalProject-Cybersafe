$(document).ready(function () {
    // on click sign up hide log in and show registration form
    $("#signup").click(function () {
        $("#first").slideUp("slow", function () {
            $("#second").slideDown("slow");
        });
    });

    // on click registration hide sign in and show log in form
    $("#signin").click(function () {
        $("#second").slideUp("slow", function () {
            $("#first").slideDown("slow");
        });
    });

});