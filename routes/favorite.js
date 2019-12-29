const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");

const {
  deleteFavorite,
  getFavoriteByUserId,
  postFavorite,
  getMostFavedPoolevents
} = require("../controller/favoritesController");

router.route("/:userId").get(verify, getFavoriteByUserId); //private

router.route("/:id").delete(verify, deleteFavorite); //private

router.route("/").post(verify, postFavorite); //private

router.route("/most/me").get(getMostFavedPoolevents); //private

module.exports = router;
