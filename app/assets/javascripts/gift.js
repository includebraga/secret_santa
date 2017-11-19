function isElementInViewport (el) {
    var rect = el.getBoundingClientRect();
    return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && /*or $(window).height() */
        rect.right <= (window.innerWidth || document.documentElement.clientWidth) /*or $(window).width() */
    );
}

window.addEventListener('scroll', function(e) {
  var gift = document.getElementsByClassName("Gift")[0];

  if (isElementInViewport(gift)){
    gift.className = "Gift Gift--withAnimation";
  }else{
    gift.className = "Gift";
  }

});
