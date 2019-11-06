const router = require("express").Router();
const pooleventController = require("../controller/poolevent");
const commentController = require("../controller/comment");

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
  .get(commentController.getComments)
  .post(commentController.postComment);

router
  .route("/comment/:id")
  .get(commentController.getCommentById)
  .put(commentController.putComment)
  .delete(commentController.deleteComment);

module.exports = router;
