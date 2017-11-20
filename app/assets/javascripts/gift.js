var animatedOnViewport = false;

var isElementInViewport = function(el) {
    var rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
    );
}

var animateGiftInViewport = function() {
  var gift = document.getElementsByClassName("Gift")[0];

  if (isElementInViewport(gift)) {
    if(!animatedOnViewport) {
      gift.className = "Gift Gift--withAnimation";

      setTimeout(function() {
        gift.className = "Gift";
      }, 1000);

      animatedOnViewport = true;
    }
  } else {
    animatedOnViewport = false;
  }
}

var animateGiftOnHover = function() {
  var gift = document.getElementsByClassName("Gift")[0];

  gift.addEventListener('mouseenter', function(e) {
    gift.className = "Gift Gift--withAnimation";
  });

  gift.addEventListener('mouseleave', function(e) {
    gift.className = "Gift";
  });
}

document.addEventListener('scroll', animateGiftInViewport);

document.addEventListener('DOMContentLoaded', function() {
  animateGiftInViewport();
  animateGiftOnHover();
});
