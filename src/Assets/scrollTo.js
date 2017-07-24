exports.init = function init(app) {
    window.onunload = function () { window.scrollTo(0, 0); }

    function scrollToTop() {
        window.scrollTo(0, 0);
    }

    app.ports.scrollToTop.subscribe(scrollToTop);
}
