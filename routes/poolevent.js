const router = require("express").Router();
const { check } = require("express-validator");
const { verify } = require("../middelware/tokenChecker");

const {
  getPoolEventByUserId,
  deletePoolEvent,
  getPoolEventById,
  getPoolEvents,
  postPoolEvent,
  putPoolEvent
} = require("../controller/pooleventController");

router
  .route("/")
  .get(getPoolEvents)
  .post(
    verify,
    [
      check("poolevent.name")
        .not()
        .isEmpty(),
      check("poolevent.state").isString(),
      check("location.street_name").isString(),
      check("location.street_number").isString(),
      check("location.long").isString(),
      check("location.lat").isString(),
      check("location.city").isString(),
      check("location.country").isString(),
      check("description.text").isString(),
      check("description.html").isString()
    ],
    postPoolEvent
  );

router
  .route("/:id")
  .get(getPoolEventById)
  .put(verify, putPoolEvent)
  .delete(verify, deletePoolEvent); //private

router.route("/user/me").get(verify, getPoolEventByUserId); //private

module.exports = router;
