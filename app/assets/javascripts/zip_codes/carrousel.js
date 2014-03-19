// PHOTO CARROUSEL

carrouselData = {};
carrouselActions = {};

Carrousel = function () {

  var delay  = carrouselData.delay = 4000;
  var carrousel  = carrouselData.carrousel = $("#carrousel");
  var itemsHolder  = carrouselData.itemsHolder = carrousel.find("> ul");
  var items  = carrouselData.items = itemsHolder.find("> li");
  var itemWidth  = carrouselData.itemWidth = items.first().width();
  var currentItem  = carrouselData.currentItem = -1;
  var timerId = carrouselData.timerId;

  var init = carrouselActions.init = function(){
    itemsHolder.css({"width": (items.length * itemWidth) + "px"});
    start();
  };

  var start = carrouselActions.start = function(){
    loop();
    timerId = window.setInterval(loop, delay);
  }

  var stop = carrouselActions.stop = function(){
    if(timerId){
      window.clearInterval(timerId);
    }
  }

  var loop = carrouselActions.loop =  function(){
    next();
  }

  var next = carrouselActions.next = function(){
    currentItem++;

    if(currentItem == items.length){
      currentItem = 0;
    }

    move();
  };


  var move = carrouselActions.move = function(){

    var leftPosition = currentItem * itemWidth * -1;

    itemsHolder.stop().animate({"left": leftPosition + "px"}, 1000);
  };
};
