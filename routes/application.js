const router = require("express").Router();
const { verify, verifyX } = require("../middelware/tokenChecker");
const {
  pooleventAccessControl,
  applicationAccessControl
} = require("../middelware/accessControlChecker");
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
  verifyX,
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
  .put(verifyX, applicationAccessControl, putApplication)
  .delete(verify, deleteApplication);

router.route("/poolevent/:id").get(getApplicationsEvent);

router.route("/user/:id").get(getApplicationsUser);
router.route("/user/:userId/statistic").get(getApplicationStatisticByUserId);

module.exports = router;
