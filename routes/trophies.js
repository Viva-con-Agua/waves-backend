const router = require("express").Router();
const { getTrophieByPeId } = require("../controller/trophieController");

router.route("/poolevent/:id").get(getTrophieByPeId); //private

module.exports = router;
