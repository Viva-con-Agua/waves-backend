const { checkChallengeComplete } = require("../service/gamificationService");
const { fetchUserById } = require("../service/usersService");

// @desc get all applications by poolevent
// @route GET /api/v1/application/event/:id
// @access Private
exports.getApplicationsEvent = (req, res) => {
  if (req.params) {
    const { id } = req.params;
    global.conn.query(
      `SELECT a.created_at,
      a.id as application_id,
      u.id as user_id,
      u.first_name,
      u.last_name,
      a.text,
      a.state
      FROM applications a
      JOIN users u ON u.id=a.user_id 
      WHERE a.poolevent_id=${id};`,
      (error, applications) => {
        if (error) {
          res.status(400).json({
            success: false,
            message: error.message
          });
        }
        getStatistic(applications, (error, app_stats) => {
          if (error) {
            res.status(400).json({
              success: false,
              error: error.message
            });
          }
          resolveUserId(app_stats, (error, app_stats_user) => {
            if (error) {
              res.status(400).json({
                success: false,
                error: error.message
              });
            }
            res.status(200).json({
              success: true,
              data: app_stats_user
            });
          });
        });
      }
    );
  } else {
    res.status(400).json({
      success: false,
      message: "event id missing"
    });
  }
};

const getStatistic = (applications, callback) => {
  let result = [];
  applications.map((application, i) => {
    global.conn.query(
      `select * from  
      (select count(*) as rejected_count from applications where state="rejected" and user_id="${application.user_id}")as rejected, 
      (select count(*)as accepted_count from applications where state="accepted" and user_id="${application.user_id}") as accepted;`,
      (error, resp) => {
        if (error) {
          callback(error);
        } else {
          application.statistic = resp[0];
          result.push(application);
          if (applications.length - 1 == i) {
            callback(null, result);
          }
        }
      }
    );
  });
};

// @desc get all applications by user
// @route GET /api/v1/application/user/:id
// @access Private
exports.getApplicationsUser = (req, res) => {
  const { id } = req.user;
  const query = `SELECT a.created_at , a.text, a.state, p.name, a.poolevent_id, a.id 
  FROM applications a 
  JOIN poolevents p 
  on a.poolevent_id=p.id 
  WHERE a.user_id="${id}";`;

  global.conn.query(query, (error, applications) => {
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
  const { id } = req.user;
  global.conn.query(
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
  const { id } = req.user;
  body.user_id = id;
  global.conn.query(
    `INSERT INTO applications SET ?`,
    body,
    (error, response) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in create application: ${error.message}`
        });
      } else {
        checkChallengeComplete("applications", id, (error, progress) => {
          res.status(200).json({
            success: true,
            data: response
          });
        });
      }
    }
  );
};

// @desc delete application by id
// @route DELETE /api/v1/application/:id
// @access Private
exports.deleteApplication = (req, res) => {
  const { id } = req.user;

  global.conn.query(
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
  console.log(body);
  global.conn.query(
    `UPDATE applications SET ? WHERE id="${id}";`,
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

// @desc edit application by id
// @route GET /api/v1/application/:id/user/statistic
// @access Private
exports.getApplicationStatisticByUserId = (req, res) => {
  const { userId } = req.params;
  global.conn.query(
    `select * from  
    (select count(*) as rejected_count from applications where state="rejected" and user_id="${userId}")as rejected, 
    (select count(*)as accepted_count from applications where state="accepted" and user_id="${userId}") as accepted;`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putApplication: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          statistic: resp
        });
      }
    }
  );
};

const resolveUserId = async (applications, callback) => {
  let result = [];
  let i = 0;
  applications.map(application => {
    fetchUserById(application.user_id, (error, user) => {
      if (error) {
        callback(error);
      }
      application.user = user;
      result.push(application);

      if (applications.length - 1 === i) {
        callback(null, result);
      }
      i++;
    });
  });
};
