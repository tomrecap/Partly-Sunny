$(document).ready(function () {

  $("form.new-session").on("click", ".submit.guest", function (event) {
    event.preventDefault();
    $(event.currentTarget).siblings("input[type=text]").attr("value", "guest");
    $(event.currentTarget).siblings("input[type=password]").attr("value", "password");
    // console.log(event.target);
    $(event.target).parent().submit();
  });

})