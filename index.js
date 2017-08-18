'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./index.html');
require('./index.css');

var ScrollTo = require('./src/Assets/scrollTo');
var ScrollEvents = require('./src/Assets/scrollEvents');

var Elm = require('./src/Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);

ScrollTo.init(app);
ScrollEvents.init(app);
