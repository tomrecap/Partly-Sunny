$(document).ready(function(){
  $("form.combined").on("ajax:success", function(event, data){
    console.log(data);
    this.reset();
    $("body").removeClass("has-active-modal")
  });


  function readUrl(input) {
    if (input.files && input.files[0]) {
      var file = input.files[0]
      var $fileInput = $(input);

      if (/jpg|jpeg|png|bmp/.exec(file.type)) {

        var reader = new FileReader();
        reader.onload = function(e) {
          var picData = e.target.result;

          // postAttachment(picData, $fileInput);
          $(input).siblings('img').attr('src', picData);
        };
        reader.readAsDataURL(input.files[0]);
      };
    }
  };

  $('form.combined').on('change', 'input.image-file-picker', function() {
    readUrl(this);
  });
});