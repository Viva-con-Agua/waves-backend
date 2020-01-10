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
      check("front.name")
        .not()
        .isEmpty(),
      check("location.route").isString(),
      check("location.street_number").isString(),
      check("location.longitude").isString(),
      check("location.latitude").isString(),
      check("location.locality").isString(),
      check("location.country").isString()
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
