const router = require("express").Router();
const {
  deletevote,
  getvoteByCommentId,
  postvote
} = require("../controller/vote");

const { verify } = require("../middelware/tokenChecker");

router.route("/:comment_id").get(getvoteByCommentId);

router.route("/").post(verify, postvote); //private

router.route("/:id").delete(verify, deletevote); //private

module.exports = router;