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

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$(
  function createFollowToggle() {
    const $buttons = $("button.follow-toggle");
    $buttons.each(
      function(idx, button) {
        new FollowToggle(button);
      }
    );
  }
);

$(
  function createUsersSearch() {
    const $navs = $("nav.users-search");
    $navs.each(
      function(idx, nav) {
        new UsersSearch(nav);
      }
    );
  }
);


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor(button) {
    this.$button = $(button);
    this.userId = this.$button.data("user-id");
    this.followState = this.$button.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$button.text("Follow");
      this.$button.prop("disabled", false);
    } else if (this.followState === "followed") {
      this.$button.text("Unfollow");
      this.$button.prop("disabled", false);
    } else if (this.followState === "unfollowing") {
      this.$button.text("Unfollowing");
      this.$button.prop("disabled", true);
    } else if (this.followState === "following") {
      this.$button.text("Following");
      this.$button.prop("disabled", true);
    }
  }

  handleClick() {
    this.$button.on("click", (event) => {
      // debugger;
      event.preventDefault();

      if (this.followState === "unfollowed") {
        this.followState = "following";
      } else {
        this.followState = "unfollowing";
      }

      this.render();

      let button = this;
      function followToggleSuccess() {
        if (button.followState === "unfollowing") {
          button.followState = "unfollowed";
        } else if (button.followState === "following"){
          button.followState = "followed";
        }
        button.render();
      }

      if (this.followState === "unfollowing") {
        APIUtil.unfollowUser(this.userId).then(followToggleSuccess);
      } else if (this.followState === "following"){
        APIUtil.followUser(this.userId).then(followToggleSuccess);
      }

    });
  }
}

module.exports = FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: "POST",
      dataType: 'JSON'
    });

  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: "DELETE",
      dataType: 'JSON'
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      method: 'GET',
      dataType: 'JSON',
      data: {
        query: queryVal
      },
      success: success
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

class UsersSearch {
  constructor(nav) {
    this.$nav = $(nav);
    this.$input = this.$nav.children("input");
    this.$ul = this.$nav.children("ul.users");
    this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(event) {
    APIUtil.searchUsers(this.$input.val(), this.renderResults.bind(this));
  }

  renderResults(users) {
    const $users = $(users);
    this.$ul.empty();
    const nav = this;
    $users.each(
      function (idx, user) {
        const $a = $('<a>');
        $a.prop("href",`/users/${user.id}`);
        $a.text(user.username);

        const $button = $(`<button type='button' class='follow-toggle' data-user-id='${user.id}' data-initial-follow-state='unfollowed' disabled='false'></button>`);
        new FollowToggle($button);

        const $li = $('<li>');
        $li.append($a);
        $li.append($button);
        nav.$ul.append($li);
      }
    );
    // this.$nav.append(this.$ul);
  }
}

module.exports = UsersSearch;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map