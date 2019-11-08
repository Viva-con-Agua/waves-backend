const router = require("express").Router();
const {
  deletePoolEvent,
  getPoolEventById,
  getPoolEventByUserId,
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
  getDirtyNotifications,
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
  .post(postPoolEvent);

router
  .route("/poolevent/:id")
  .get(getPoolEventById)
  .put(putPoolEvent)
  .delete(deletePoolEvent);

router.route("/comment").post(postComment);

router
  .route("/comment/:pooleventId")
  .get(getCommentsByPooleventId);

router
  .route("/comment/:id")
  .put(putComment)
  .delete(deleteComment);

router.route("/vote").post(postvote);

router.route("/vote/:comment_id").get(getvoteByCommentId);

router.route("/vote/:id").delete(deletevote);

router.route("/favorite/:userId").get(getFavoriteByUserId);

router.route("/favorite/:id").delete(deleteFavorite);

router.route("/favorite").post(postFavorite);

router.route("/notification/:userId").get(getNotificationByUserId);

router.route("/notification/dirty").get(getDirtyNotifications);

router
  .route("/badge")
  .post(postBadge)
  .get(getAllBadges);

module.exports = router;
