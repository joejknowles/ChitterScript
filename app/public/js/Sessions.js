function Session(username) {
  this.username = username;
}
Session.prototype.leave = function () {
  this.username = undefined;
} ;