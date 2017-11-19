function isElementInViewport (el) {
    var rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
    );
}

function animateGiftInViewport() {
  var gift = document.getElementsByClassName("Gift")[0];

  if (isElementInViewport(gift)) {
    gift.className = "Gift Gift--withAnimation";

    setTimeout(function() {
      gift.className = "Gift";
    }, 1000);

  } else {
    gift.className = "Gift";
  }
}

function animateGiftOnHover() {
  var gift = document.getElementsByClassName("Gift")[0];

  gift.addEventListener('mouseenter', function(e) {
    gift.className = "Gift Gift--withAnimation";
  });

  gift.addEventListener('mouseleave', function(e) {
    gift.className = "Gift";
  });
}

window.addEventListener('scroll', animateGiftInViewport);

document.addEventListener('DOMContentLoaded', function() {
  animateGiftInViewport();
  animateGiftOnHover();
});
