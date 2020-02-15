const router = require("express").Router();
const { getRegions } = require("../controller/regionController");
const { getAllMonths } = require("../controller/monthController");
const { initGamificationProfile } = require("../controller/profileController");
const { authenticate } = require("../controller/oauthController");
const { postAchievement } = require("../controller/achievementConroller");
const { getInformation } = require("../controller/infoController");
const { verify, verifyX } = require("../middelware/tokenChecker");
const {
  pooleventAccessControl
} = require("../middelware/accessControlChecker");

const { getApplicationsUser } = require("../controller/applicationController");

const {
  postBadge,
  getAllBadgesByUserId,
  getAllBadges,
  averageUserCompletedAchievement
} = require("../controller/badgesController");

router.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!"
  });
});

router.route("/badge").post(postBadge);

router.route("/badge/user/:userId").get(verify, getAllBadgesByUserId);

router.route("/badge").get(verify, getAllBadges);

router.route("/regions").get(getRegions);

router.route("/months").get(getAllMonths);

router.route("/profile/init/:userId").get(initGamificationProfile);

router.route("/achievement").post(postAchievement);

router.route("/onboarding").get(getApplicationsUser);

router.route("/oauth").get(authenticate);

router.route("/info").get(verifyX, pooleventAccessControl, getInformation);

router.route("/achievement/avg/:id").get(averageUserCompletedAchievement);

router.route("/test", verifyX, pooleventAccessControl).get((req, res) => {
  res.json({ scoop: "scoop", message: req.user });
});

module.exports = router;
