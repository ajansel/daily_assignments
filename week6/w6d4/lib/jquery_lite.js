/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

//entry file
//core function is $l

const DOMNodeCollection = __webpack_require__(1);

function $l(selector) {
  if(selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  } else if (typeof selector === "string") {
    let nodeList = document.querySelectorAll(selector);
    let array = [];
    nodeList.forEach((node) => array.push(node));
    return new DOMNodeCollection(array);
  }

}

// $l(arg)

window.$l = $l;


/***/ }),
/* 1 */
/***/ (function(module, exports) {




class DOMNodeCollection {

  constructor(array) {
    this.array = array;
  }

  html(string) {
    // debugger;
    if(string === undefined) return this.array[0].innerHTML;
    this.array.forEach((element) => {
      element.innerHTML = string;
    });
    return string;
  }
  //innerHTML means all content inside the tags of a particular html element
  //text, other html elements, ie

  empty() {
    this.html("");
  }

  append(arg) {
    if (arg instanceof DOMNodeCollection) {
      this.array.forEach((parentElement) => {
        arg.array.forEach((childElement) => {
          parentElement.innerHTML += childElement.outerHTML;
        });
      });
    } else { //aka if it is an HTMLElement or String
      this.array.forEach((parentElement) => {
        parentElement.innerHTML += arg.outerHTML;
      });
    }
  }

  // Come back to add and remove class later, give it the functionality to recieve a function
  addClass(classString) {
    this.array.forEach((element) => {
      element.classList.add(classString);
    });
  }

  removeClass(classString) {
    this.array.forEach((element) => {
      element.classList.remove(classString);
    });
  }

  attr(attribute, value) {
    let result = undefined;
    if (value === undefined) {
      this.array.forEach((element) => {
        result = element.getAttribute(attribute);
      });
    } else {
      this.array.forEach((element) => {
        element.setAttribute(attribute, value);
      });
    }

    return result;
  }
}
module.exports = DOMNodeCollection;


/***/ })
/******/ ]);