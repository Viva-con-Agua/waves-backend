const router = require("express").Router();
const { check } = require("express-validator");
const { verify } = require("../middelware/tokenChecker");

const {
  getAllPeType,
  deletePeType,
  postPeType,
  putPeType
} = require("../controller/pooleventTypeController");

router
  .route("/")
  .get(getAllPeType)
  .post( postPeType);

router
  .route("/:id")
  .put(verify, putPeType)
  .delete(verify, deletePeType); //private

module.exports = router;
