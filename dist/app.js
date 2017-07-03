/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';

	__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"ace-css/css/ace.css\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));
	__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"font-awesome/css/font-awesome.css\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

	__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./index.html\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

	var Elm = __webpack_require__(3);
	var mountNode = document.getElementById('main');

	var app = Elm.Main.embed(mountNode);

/***/ },
/* 2 */,
/* 3 */
/***/ function(module, exports) {

	module Main exposing (..)

	import Html exposing (Html, div, text, program)


	-- MODEL


	type alias Model =
	    String


	init : ( Model, Cmd Msg )
	init =
	    ( "Hello World with Webpack v9999", Cmd.none )



	-- MESSAGES


	type Msg
	    = NoOp



	-- VIEW


	view : Model -> Html Msg
	view model =
	    div []
	        [ text model ]



	-- UPDATE


	update : Msg -> Model -> ( Model, Cmd Msg )
	update msg model =
	    case msg of
	        NoOp ->
	            ( model, Cmd.none )



	-- SUBSCRIPTIONS


	subscriptions : Model -> Sub Msg
	subscriptions model =
	    Sub.none



	-- MAIN


	main : Program Never Model Msg
	main =
	    program
	        { init = init
	        , view = view
	        , update = update
	        , subscriptions = subscriptions
	        }


/***/ }
/******/ ]);