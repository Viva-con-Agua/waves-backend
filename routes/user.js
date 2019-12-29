const router = require("express").Router();
const { getAllUsers } = require("../controller/userController");

router.route("/").get(getAllUsers); //private

module.exports = router;
