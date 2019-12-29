const router = require("express").Router();
const { verify } = require("../middelware/tokenChecker");

const {
    deleteApplication,
    getApplicationById,
    getApplicationsEvent,
    getApplicationsUser,
    postApplication,
    putApplication
  } = require("../controller/applicationController");


router.route("/").post(verify, postApplication);

router
  .route("/:id")
  .get(getApplicationById)
  .put(verify ,putApplication)
  .delete(verify, deleteApplication);

router.route("/poolevent/:id").get(getApplicationsEvent);

router.route("/user/:id").get(verify, getApplicationsUser);


module.exports = router;
