const initConnection = require("../config/connectMysql").initConnection;

// @desc get all applications by poolevent
// @route GET /api/v1/application/event/:id
// @access Private
exports.getApplicationsEvent = (req, res) => {
    const { id } = req.params;
    const conn = initConnection();
    conn.query(`SELECT * FROM applications p WHERE p.poolevent_id='${id}';`, (error, applications) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: error.message
        });
      }
      res.status(200).json({
        success: true,
        data: applications
      });
    });
  };

// @desc get all applications by user
// @route GET /api/v1/application/user/:id
// @access Private
exports.getApplicationsUser = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(`SELECT * FROM applications p WHERE p.user_id='${id}';`, (error, applications) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: error.message
      });
    }
    res.status(200).json({
      success: true,
      data: applications
    });
  });
};

// @desc get application by id
// @route GET /api/v1/application/:id
// @access Private
exports.getApplicationById = (req, res) => {
    const { id } = req.params;
    const conn = initConnection();
    conn.query(
      `SELECT * FROM applications p WHERE p.id='${id}';`,
      (err, application) => {
        if (err) {
          res.status(400).json({
            success: false,
            message: `Error in getApplicationById: ${err.message}`
          });
        } else {
          res.status(200).json({
            success: true,
            data: application
          });
        }
      }
    );
  };

// @desc  create application
// @route POST /api/v1/application
// @access Private
exports.postApplication = (req, res) => {
    const { body } = req;
    const conn = initConnection();
    conn.query(`INSERT INTO applications SET ?`, body, (error, response) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in create application: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: response
        });
      }
    });
  };

// @desc delete application by id
// @route DELETE /api/v1/application/:id
// @access Private
exports.deleteApplication = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `DELETE FROM applications WHERE applications.id='${id}';`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deleteApplication ${error.message}`
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

// @desc edit application by id
// @route PUT /api/v1/application/:id
// @access Private
exports.putApplication = (req, res) => {
  const { body } = req;
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `UPDATE applications SET ? WHERE id =${id};`,
    body,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putApplication: ${error.message}`
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

  
  
  