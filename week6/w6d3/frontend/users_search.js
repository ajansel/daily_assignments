const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

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
