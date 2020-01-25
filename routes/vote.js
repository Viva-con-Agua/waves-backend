const router = require("express").Router();
const { check } = require("express-validator");

const {
  deletevote,
  getvoteByCommentId,
  postvote
} = require("../controller/voteController");

const { verify } = require("../middelware/tokenChecker");

router.route("/:comment_id").get(getvoteByCommentId);

router.route("/").post(
  verify,
  check("comment_id")
    .not()
    .isEmpty()
    .isNumeric(),
  postvote
); //private

router.route("/:id").delete(verify, deletevote); //private

module.exports = router;
