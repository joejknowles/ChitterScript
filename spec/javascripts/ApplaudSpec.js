describe('has an applaud button', function() {
  it('does', function() {
    var applause;
    applause = new Cheep ;
    applause = applause.applause ;
    expect(applause).toEqual(0) ;
  });
});