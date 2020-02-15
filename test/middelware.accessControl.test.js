const { pooleventAccessControl } = require("../middelware/accessControlChecker");

test("expect true", () => {
  expect(pooleventAccessControl()).toBe(Object);
});
