const APIUtil = require("./api_util.js");

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
