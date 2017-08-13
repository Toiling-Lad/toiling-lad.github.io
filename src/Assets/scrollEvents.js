var throttle = require('lodash/throttle');

exports.init = function init(app) {
    var lastScrollTop = 0;

    function header(scrollTop, scrollHeight, clientHeight) {
        var header = document.getElementById('NavContainer');
        var navbarHeight = header.clientHeight
        var delta = 20;
        var didScroll;
        var st = scrollTop;
        document.getElementById('NavTitle').style.color = "black";

        if (document.querySelector('svg#SvgIcon > svg > path')) {
            document.querySelector('svg#SvgIcon > svg > path').style.fill = "black";
        }

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
                document.getElementById('NavTitle').style.color = "white";
                document.querySelector('svg#SvgIcon > svg > path').style.fill = "white";

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

    function footerNext(scrollTop, scrollHeight, clientHeight) {
        var footer = document.getElementById('FooterNext');
        var footerSection = document.getElementById('FooterSection');

        var windowHeight = document.documentElement.clientHeight;
        var windowTopPosition = document.body.scrollTop;
        var windowBottomPosition = (windowTopPosition + windowHeight);

        var footerHeight = footerSection.clientHeight;
        var footerTopPosition = footerSection.offsetTop;
        var footerBottomPosition = (footerTopPosition + footerHeight);

        if ((footerBottomPosition >= windowTopPosition) && (footerTopPosition <= windowBottomPosition)) {
            if ((windowBottomPosition - footerTopPosition) >= (windowHeight)) {
                setTranslate(0, (windowHeight / 2), footer)
            } else {
                setTranslate(0, ((windowBottomPosition - footerTopPosition) / 2), footer)
            }

        } else
            if (footerBottomPosition >= windowTopPosition) {
                setTranslate(0, -100, footer)

            }
    }


    function setTranslate(xPos, yPos, el) {
        el.style.transform = `matrix3d( ${(yPos + 2) / 500}, 0, 0, 0, 
                                        0, ${(yPos + 1) / 500}, 0, 0, 
                                        0, 0, 20, 0, 
                                        0, ${(yPos + 1)}, 0, 1)`;
        el.style.transition = "all 200ms linear";

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
        footerNext(scrollTop, scrollHeight, clientHeight)




    }


    window.onscroll = throttle(onScroll, 100);
}
