const initConnection = require("../config/connectMysql").initConnection;

// @desc get all poolevents
// @route GET /api/v1/poolevent
// @access Public
//TODO: pagination + sorting
exports.getPoolEvents = (req, res) => {
  const conn = initConnection();
  conn.query("SELECT * FROM poolevents;", (error, poolevents) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: error.message
      });
    }
    res.status(200).json({
      success: true,
      data: poolevents
    });
  });
};

// @desc get poolevent by id
// @route GET /api/v1/poolevent/:id
// @access Public
exports.getPoolEventById = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `SELECT * FROM poolevents p WHERE p.id='${id}';`,
    (err, poolevent) => {
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getPoolEventById: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: poolevent
        });
      }
    }
  );
};

// @desc  create poolevent
// @route POST /api/v1/poolevent
// @access Private
exports.postPoolEvent = (req, res) => {
  const { body } = req;
  const conn = initConnection();
  conn.query(`INSERT INTO poolevents SET ?`, body, (error, response) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in create poolevent: ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: response
      });
    }
  });
};

// @desc delete poolevent by id
// @route DELETE /api/v1/poolevent/:id
// @access Private
exports.deletePoolEvent = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `DELETE FROM poolevents  WHERE poolevents.id='${id}';`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deletePoolevent ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};

// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.putPoolEvent = (req, res) => {
  const { body } = req;
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `UPDATE poolevents SET ? WHERE id =${id};`,
    body,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putPoolEvent: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};
