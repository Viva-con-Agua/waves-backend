const router = require("express").Router();

const { getAllMonths } = require("../controller/monthController");

router.route("/").get(getAllMonths); //private

module.exports = router;
