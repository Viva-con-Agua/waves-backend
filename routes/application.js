const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");
const { checkAccessControl } = require("../middelware/accessControlChecker");
const { check } = require("express-validator");

const {
  deleteApplication,
  getApplicationsEvent,
  getApplicationsUser,
  postApplication,
  putApplication,
  getApplicationStatisticByUserId
} = require("../controller/applicationController");

router.route("/").post(
  verify,
  [
    check("text").isString(),
    check("poolevent_id")
      .not()
      .isEmpty()
      .isNumeric()
  ],
  postApplication
);

router
  .route("/:id")
  .put(verify, checkAccessControl("updateAny", "application"), putApplication)
  .delete(verify, deleteApplication);

router.route("/poolevent/:id").get(getApplicationsEvent);

router.route("/user").get(verify, getApplicationsUser);
router
  .route("/user/:userId/statistic")
  .get(getApplicationStatisticByUserId);

module.exports = router;
