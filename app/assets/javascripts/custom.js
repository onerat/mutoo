  var didscroll;
  var lastScrollTop = 0;
  var delta = 3; // 동작의 구현이 시작되는 위치
  var navbarHeight = $('.menuContain').outerHeight(); // 영향을 받을 요소를 선택
    
  $(window).scroll(function(event) { didscroll = true });
    
  setInterval(function() {
    if (didscroll) {
      hasScrolled();
      didscroll = false;
    }
  }, 250);
  
  function hasScrolled() {
    var st = $(this).scrollTop();
    
    if(Math.abs(lastScrollTop - st) <= delta)
      return;
      
    if(st > lastScrollTop && st > navbarHeight) {
      $('.menuContain').removeClass('nav-down').addClass('nav-up');
    } else {
      if(st + $(window).height() < $(document).height()) {
        $('.menuContain').removeClass('nav-up').addClass('nav-down');
      }
    }
    
    lastScrollTop = st;
    
  };