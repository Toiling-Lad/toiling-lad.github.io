'use strict';

require('ace-css/css/ace.css');
require('font-awesome/css/font-awesome.css');

require('./index.html');
require('../index.css');

var ScrollTo = require('./Assets/scrollTo');
var ScrollEvents = require('./Assets/scrollEvents');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);

ScrollTo.init(app);
ScrollEvents.init(app);
