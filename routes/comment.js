
const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");


const {
    deleteComment,
    getCommentsByPooleventId,
    postComment,
    putComment
  } = require("../controller/commentController");

router.route("/").post(verify, postComment); //private

router.route("/:pooleventId").get(getCommentsByPooleventId);

router
  .route("/:id")
  .put(verify, putComment) //private
  .delete(verify, deleteComment); //private


module.exports = router;