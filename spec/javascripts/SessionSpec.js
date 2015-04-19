describe('session', function () {
  it('remembers your username', function () {
    var session = new Session('joejknowles');
    expect(session.username).toEqual('joejknowles');
  });

  it('forgets your username on sign out', function () {
    var session = new Session('joejknowles');
    expect(session.username).toEqual('joejknowles');
    session.leave();
    expect(session.username).toEqual(undefined);
  });
});