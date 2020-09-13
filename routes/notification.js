const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");

// const {
//   getNewNotificationsByUserId,
//   getNotificationByUserId
// } = require("../controller/notificationController");

// router.route("/user").get(verify, getNotificationByUserId);

// router.route("/user/:userId/new").get(verify, getNewNotificationsByUserId);

module.exports = router;
