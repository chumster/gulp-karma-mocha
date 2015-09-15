// Should Pass 
describe('greeter', function () {
  it('should say Hello to the World', function () {
    expect(greet('World')).to.equal('Hello, World!');
  });
});

// Should Fail
describe('greeter', function () {
  it('should say Hello to the World', function () {
    expect(greet('World')).to.equal('Yo! Hello, World!');
  });
});
