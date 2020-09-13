const router = require("express").Router();
const { getRegions } = require("../controller/regionController");
const { getAllMonths } = require("../controller/monthController");
const { initGamificationProfile } = require("../controller/profileController");
const { authenticate } = require("../controller/oauthController");
const { postAchievement } = require("../controller/achievementConroller");
const { getInformation } = require("../controller/infoController");
const { verify } = require("../middelware/tokenChecker");
const { checkProfileComplete } = require("../service/gamification");
const { getNotifications } = require("../controller/notificationController");

const { getApplicationsUser } = require("../controller/applicationController");

const {
  postBadge,
  getAllBadgesByUserId,
  getAllBadges,
  averageUserCompletedAchievement,
} = require("../controller/badgesController");

router.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!",
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

router.route("/info").get(verify, getInformation);

router.route("/notifications").get(getNotifications);

router.route("/achievement/avg/:id").get(averageUserCompletedAchievement);

router.route("/test").get((req, res) => {
  checkProfileComplete("4a74141e-c2c0-46a0-9c0c-84bef8be7d0f");
});

module.exports = router;
