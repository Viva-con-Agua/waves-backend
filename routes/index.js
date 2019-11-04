const router = require("express").Router();
const pooleventController = require("../controller/poolevent");

router
  .route("/poolevent")
  .get(pooleventController.getPoolEvents)
  .post(pooleventController.postPoolEvent);

router
  .route("/poolevent/:id")
  .get(pooleventController.getPoolEventById)
  .put(pooleventController.putPoolEvent)
  .delete(pooleventController.deletePoolEvent);

module.exports = router;
