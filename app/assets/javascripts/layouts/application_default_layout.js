// for favorite cities dropdown
var changeStarToFavorited = function (element) {
  console.log("about to add favorite star to:");
  console.log(element);

  $(element).addClass("true");
  $(element).removeClass("false");
};

var changeStarToUnfavorited = function (element) {
  console.log("about to remove favorite star from:");
  console.log(element);

  $(element).removeClass("true");
  $(element).addClass("false");
};

$(document).ready(function() {

  window.modal = {
    show: function(){
      $("body").addClass("has-active-modal");
    },
    hide: function(){
      $("body").removeClass("has-active-modal");
    }
  };

  $("body").on("click", ".show-modal", function(event){
    event.preventDefault();
    window.modal.show();
  });

  $(".modal").on("click", function(event){
    $target = $(event.target);
    if($target.is(".modal") || $target.is(".modal-close-button")){
      event.preventDefault();
      window.modal.hide();
    }
  });

  $(".favorite-form").addClass("hidden");

  $(".current-weather-summary").on("click","a.favorite", function(event) {
    event.preventDefault();
    console.log("should see this once");
    var that = this;
    var urlStub = modifyFavoriteCityLinkUrlStubForDropdown;
    var zipCodeId = $(that).attr("data-zip-code-id");
    var completeUrl = urlStub + zipCodeId;

    if ($(that).hasClass("true")) {
      $.ajax({
        url: completeUrl,
        type: "DELETE",
        success: changeStarToUnfavorited(that)
      });
    } else {
      $.ajax({
        url: completeUrl,
        type: "POST",
        success: changeStarToFavorited(that)
      });
    };
  });

});