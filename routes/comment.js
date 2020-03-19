const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");
const { checkAccessControl } = require("../middelware/accessControlChecker");
const { check } = require("express-validator");

const {
  deleteComment,
  getCommentsByPooleventId,
  getCommentsByUserId,
  getCommentResponses,
  postComment,
  putComment
} = require("../controller/commentController");

router.route("/").post(
  verify,
  checkAccessControl("createOwn", "comment"),
  check("text")
    .not()
    .isEmpty()
    .isString(),
  postComment
); //private

router.route("/:pooleventId").get(getCommentsByPooleventId);
router.route("/response/:commentId").get(getCommentResponses);
router.route("/user/:userId").get(getCommentsByUserId);

router
  .route("/:id")
  .put(verify, putComment) //private
  .delete(verify, deleteComment); //private

module.exports = router;
