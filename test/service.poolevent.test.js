const { updatePoints } = require("../service/gamification");

test("expect true", () => {
  expect(updatePoints(1, 1, "poolevent")).toBe(true);
});
