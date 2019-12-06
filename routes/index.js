const router = require("express").Router();
const { getRegions } = require("../controller/region");
const { getAllMonths } = require("../controller/month");
const { initGamificationProfile } = require("../controller/profile");
const { authenticate } = require("../controller/oauth");
const { postAchievement } = require("../controller/achievement");
const { verify } = require("../middelware/tokenChecker");

const {
  deleteApplication,
  getApplicationById,
  getApplicationsEvent,
  getApplicationsUser,
  postApplication,
  putApplication
} = require("../controller/application");







const {
  deleteFavorite,
  getFavoriteByUserId,
  postFavorite
} = require("../controller/favorites");

const { postBadge, getAllBadges } = require("../controller/badges");

router.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!"
  });
});






router.route("/favorite/:userId").get(verify, getFavoriteByUserId); //private

router.route("/favorite/:id").delete(verify, deleteFavorite); //private

router.route("/favorite").post(verify, postFavorite); //private



router.route("/badge").get(postBadge);

router.route("/badge/user/:userId").get(verify, getAllBadges);

router.route("/regions").get(getRegions);

router.route("/months").get(getAllMonths);

router.route("/profile/init/:userId").get(initGamificationProfile);

router.route("/achievement").post(postAchievement);



router.route("/onboarding").get(getApplicationsUser);

router.route("/oauth").get(authenticate);

module.exports = router;
