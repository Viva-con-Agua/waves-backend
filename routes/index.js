const router = require("express").Router();
const pooleventController = require("../controller/poolevent");
const applicationController = require("../controller/application");


router
  .route("/poolevent")
  .get(pooleventController.getPoolEvents)
  .post(pooleventController.postPoolEvent);

router
  .route("/poolevent/:id")
  .get(pooleventController.getPoolEventById)
  .put(pooleventController.putPoolEvent)
  .delete(pooleventController.deletePoolEvent);

router
  .route("/application")
  .post(applicationController.postApplication);

router
  .route("/application/:id")
  .get(applicationController.getApplicationById)
  .put(applicationController.putApplication)
  .delete(applicationController.deleteApplication);

router
  .route("/application/event/:id")
  .get(applicationController.getApplicationsEvent)

router
  .route("/application/user/:id")
  .get(applicationController.getApplicationsUser)

module.exports = router;
