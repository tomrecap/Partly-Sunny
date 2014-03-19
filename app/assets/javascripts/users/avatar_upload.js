// preview avatar before uploading
var avatarFileUpload = {};

avatarFileUpload.readUrl = function (input) {
  if (input.files && input.files[0]) {
    var file = input.files[0]
    var $fileInput = $(input);

    if (/jpg|jpeg|png|bmp/.exec(file.type)) {

      var reader = new FileReader();
      reader.onload = function(e) {
        var picData = e.target.result;

        // postAttachment(picData, $fileInput);
        $('img.new-avatar').attr('src', picData);
        $('img.new-avatar').removeClass("empty");
      };
      reader.readAsDataURL(input.files[0]);
    };
  }
};