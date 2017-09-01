var throttle = require('lodash/throttle');

exports.init = function init(app) {
    var lastScrollTop = 0;

    function header(scrollTop, scrollHeight, clientHeight) {
        var header = document.getElementById('NavContainer');
        var navbarHeight = header.clientHeight
        var delta = 20;
        var didScroll;
        var st = scrollTop;

        if (Math.abs(lastScrollTop - st) <= delta)
            return;

        if (st > lastScrollTop && st > navbarHeight) {
            // Scroll Down
            if (header.style.opacity > 0) {
                header.style.opacity = 0;
                header.style.transition = "all 300ms linear";

            } else {
                header.style.visibility = "hidden";
            }

            if (header.style.opacity < 1 && ((window.innerHeight + window.scrollY + delta) >= document.body.offsetHeight)) {
                header.style.opacity = 1;
                header.style.transition = "all 300ms linear";
                header.style.visibility = "visible";
            }
        } else {
            // Scroll Up
            if (st + clientHeight < scrollHeight) {
                header.style.opacity = 1;
                header.style.visibility = "visible";
            }
        }

        lastScrollTop = st;
    }


    function items() {
        var windowHeight = document.documentElement.clientHeight;
        var windowTopPosition = document.body.scrollTop;
        var windowBottomPosition = (windowTopPosition + windowHeight);
        var animationElements = document.querySelectorAll('div#FlexItem')

        for (i = 0; i < animationElements.length; ++i) {
            var element = animationElements[i];
            var elementHeight = element.clientHeight;
            var elementTopPosition = element.offsetTop;
            var elementBottomPosition = (elementTopPosition + elementHeight);

            if ((elementBottomPosition >= windowTopPosition) && (elementTopPosition <= windowBottomPosition)) {
                element.style.transform = "translate3d(0px, -100px, 0px)";
                element.style.transition = "all 400ms linear";
            } else if (elementBottomPosition >= windowTopPosition) {
                element.style.transform = "translate3d(0px, 0px, 0px)";
                element.removeAttribute = "style";
            }
        };
    }

    function onScroll() {
        if (document.querySelector('body')) {
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            var scrollHeight = document.body.scrollHeight;
            var clientHeight = document.documentElement.clientHeight;


            app.ports.onFeedScroll.send({
                scrollTop: scrollTop ? Math.floor(scrollTop) : 0,
                scrollHeight: scrollHeight ? Math.floor(scrollHeight) : 0,
                clientHeight: clientHeight ? Math.floor(clientHeight) : 0,
            });
        }

        header(scrollTop, scrollHeight, clientHeight)
        items()




    }


    window.onscroll = throttle(onScroll, 100);
}
