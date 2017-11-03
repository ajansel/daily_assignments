const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

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
