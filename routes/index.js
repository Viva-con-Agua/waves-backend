const router = require("express").Router();
const { check } = require("express-validator");
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
  getPoolEventByUserId,
  deletePoolEvent,
  getPoolEventById,
  getPoolEvents,
  postPoolEvent,
  putPoolEvent
} = require("../controller/poolevent");

const {
  deleteComment,
  getCommentsByPooleventId,
  postComment,
  putComment
} = require("../controller/comment");

const {
  deletevote,
  getvoteByCommentId,
  postvote
} = require("../controller/vote");

const {
  deleteFavorite,
  getFavoriteByUserId,
  postFavorite
} = require("../controller/favorites");

const {
  getNewNotificationsByUserId,
  getNotificationByUserId
} = require("../controller/notification");

const { postBadge, getAllBadges } = require("../controller/badges");

router.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i'm alive!"
  });
});


router
  .route("/poolevent")
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
  .route("/poolevent/:id")
  .get(getPoolEventById)
  .put(putPoolEvent)//private
  .delete(deletePoolEvent);//private

router.route("/poolevent/user/me").get(verify, getPoolEventByUserId); //private

router.route("/comment").post(postComment);

router.route("/comment/:pooleventId").get(getCommentsByPooleventId);

router
  .route("/comment/:id")
  .put(putComment)
  .delete(deleteComment);

router.route("/vote").post(postvote);

router.route("/vote/:comment_id").get(getvoteByCommentId);

router.route("/vote/:id").delete(deletevote);

router.route("/favorite/:userId").get(verify, getFavoriteByUserId);

router.route("/favorite/:id").delete(deleteFavorite);

router.route("/favorite").post(verify, postFavorite);

router.route("/notification/:userId").get(getNotificationByUserId);

router.route("/notification/user/:userId/new").get(getNewNotificationsByUserId);

router.route("/badge").get(postBadge);

router.route("/badge/user/:userId").get(getAllBadges);

router.route("/regions").get(getRegions);

router.route("/months").get(getAllMonths);

router.route("/profile/init/:userId").get(initGamificationProfile);

router.route("/achievement").post(postAchievement);

router.route("/application").post(postApplication);

router
  .route("/application/:id")
  .get(getApplicationById)
  .put(putApplication)
  .delete(deleteApplication);

router.route("/application/poolevent/:id").get(getApplicationsEvent);

router.route("/application/user/:id").get(verify, getApplicationsUser);

router.route("/onboarding").get(getApplicationsUser);

router.route("/oauth").get(authenticate);

module.exports = router;
