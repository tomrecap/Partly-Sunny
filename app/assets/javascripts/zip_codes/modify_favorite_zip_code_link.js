// STARS TO FAVORITE & UNFAVORITE CITIES
var changeStarToFavorited = function (element) {
  $(element).removeClass("false");
  $(element).addClass("true");
};

var changeStarToUnfavorited = function (element) {
  $(element).removeClass("true");
  $(element).addClass("false");
};

var toggleFavoriteAJAXRequest = function (starElement) {

  if ($(starElement).hasClass("true")) {
      $.ajax({
        url: modifyFavoriteCityLinkUrl,
        type: "DELETE",
        success: changeStarToUnfavorited(starElement)
      });
  } else {
    $.ajax({
      url: modifyFavoriteCityLinkUrl,
      type: "POST",
      success: changeStarToFavorited(starElement)
    });
  };
};