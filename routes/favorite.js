const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");
const { checkAccessControl } = require("../middelware/accessControlChecker");

const {
  deleteFavorite,
  getFavoriteByUserId,
  postFavorite,
  getMostFavedPoolevents
} = require("../controller/favoritesController");

router.route("/user/:id").get(getFavoriteByUserId); //private

router
  .route("/:id")
  .delete(verify, checkAccessControl("deleteOwn", "favorite"), deleteFavorite); //private

router
  .route("/")
  .post(verify, checkAccessControl("createOwn", "favorite"), postFavorite); //private

router.route("/most/me").get(getMostFavedPoolevents); //private

module.exports = router;
