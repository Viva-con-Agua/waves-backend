const router = require("express").Router();
const { getAllUsers, fetchUserById } = require("../controller/userController");

router.route("/").get(getAllUsers); //private
router.route("/:id").get(fetchUserById); //private todo

module.exports = router;
