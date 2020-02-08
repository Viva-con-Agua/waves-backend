const router = require("express").Router();
const { check } = require("express-validator");
const { verify } = require("../middelware/tokenChecker");
const { checkAccessControl } = require("../middelware/accessControlChecker");

const {
  getPoolEventByUserId,
  getPoolEventsForNotifications,
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
    checkAccessControl("createAny", "poolevent"),
    [
      check("front.name")
        .not()
        .isEmpty()
        .isString(),
      check("front.idevent_type")
        .not()
        .isEmpty()
        .isNumeric(),
      check("front.active_user_only").isBoolean(),
      check("front.website").isURL(),
      check("front.supporter_lim").isNumeric(),
      check("front.application_start").isISO8601(),
      check("front.application_end").isISO8601(),
      check("front.event_start").isISO8601(),
      check("front.event_end").isISO8601(),
      check("location.route").isString(),
      check("location.street_number")
        .not()
        .isEmpty()
        .isString(),
      check("location.longitude")
        .not()
        .isEmpty()
        .isString(),
      check("location.latitude")
        .not()
        .isEmpty()
        .isString(),
      check("location.locality")
        .not()
        .isEmpty()
        .isString(),
      check("location.postal_code")
        .not()
        .isEmpty()
        .isString(),
      check("location.desc").isString(),
      check("description.text").isString(),
      check("description.html").isString()

    ],
    postPoolEvent
  );

router
  .route("/notify")
  .get(getPoolEventsForNotifications);


router
  .route("/:id")
  .get(getPoolEventById)
  .put(verify, checkAccessControl("updateAny", "poolevent"), putPoolEvent)
  .delete(
    verify,
    checkAccessControl("updateAny", "poolevent"),
    deletePoolEvent
  ); //private



router.route("/user/me").get(verify, getPoolEventByUserId); //private

module.exports = router;
