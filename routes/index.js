const router = require("express").Router();
const pooleventController = require("../controller/poolevent");
const commentController = require("../controller/comment");
const voteController = require("../controller/vote");
const favoriteController = require("../controller/favorites");

router
  .route("/poolevent")
  .get(pooleventController.getPoolEvents)
  .post(pooleventController.postPoolEvent);

router
  .route("/poolevent/:id")
  .get(pooleventController.getPoolEventById)
  .put(pooleventController.putPoolEvent)
  .delete(pooleventController.deletePoolEvent);

router
  .route("/comment")
  .post(commentController.postComment);

router
  .route("/comment/:pooleventId")
  .get(commentController.getCommentsByPooleventId)

router
  .route("/comment/:id")
  .put(commentController.putComment)
  .delete(commentController.deleteComment);

router.route("/vote").post(voteController.postvote);

router.route("/vote/:comment_id").get(voteController.getvoteByCommentId);

router.route("/vote/:id").delete(voteController.deletevote);

router.route("/favorite/:userId").get(favoriteController.getFavoriteByUserId);

router.route("/favorite/:id").delete(favoriteController.deleteFavorite);

router.route("/favorite").post(favoriteController.postFavorite);
module.exports = router;
