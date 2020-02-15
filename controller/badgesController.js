const { initConnection } = require("../config/connectMysql");

// @desc get Badge by id
// @route GET /api/v1/Badge/:id
// @access Public
exports.getAllBadgesByUserId = (req, res) => {
  const { id } = req.user;
  const conn = initConnection();
  global.conn.query(
    `SELECT b.id,
    b.name, 
    b.desc as message, 
    bp.progress,
    c.points,c.desc, 
    b.img_url, 
    bp.completed 
    FROM badges b 
    JOIN badge_progress bp ON b.id=bp.badge_id 
    JOIN challenges c ON c.badge_id=b.id  
    WHERE bp.user_id='${id}'`,
    (err, badges) => {
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getBadgeId: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: badges
        });
      }
    }
  );
};

// @desc  create Badge
// @route POST /api/v1/badge
// @access Private
//TODO: desc
exports.postBadge = (req, res) => {
  const { body, user } = req;
  body.user_id = user.id;
  let conn = initConnection();
  global.conn.query(`INSERT INTO badges SET ?`, body, (error, Badge) => {
    if (error) {
      res.status(400).json({ success: false, messaage: error.message });
    } else {
      res.status(200).json({ success: true, data: Badge });
    }
  });
};

// @desc delete Badge by id
// @route DELETE /api/v1/Badge/:id
// @access Private
exports.deleteBadge = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  global.conn.query(
    `DELETE FROM badges b WHERE b.id='${id}'`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deleteBadge ${error.message}`
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

exports.getAllBadges = (req, res) => {
  const conn = initConnection();
  global.conn.query(
    `select b.name, b.img_url, b.desc, b.id from badges b join  challenges c on b.id=c.badge_id;`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deleteBadge ${error.message}`
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

exports.averageUserCompletedAchievement = (req, res) => {
  getBadgeProgressByBadgeId(req.params.id, (error, average) => {
    if (error) {
      res.status(500).json({ success: false, message: error.message });
    }
    res.json({ success: true, average });
  });
};

const getBadgeProgressByBadgeId = (id, callback) => {
  global.conn.query(
    `select count(*) as completed_count 
    from badge_progress 
    where completed=1 
    and badge_id=${id}`,
    (error, completedCount) => {
      if (error) {
        callback(error);
      }
      global.conn.query(
        `select count(*) cc 
        from badge_progress 
        where badge_id=${id}`,
        (error, totalCount) => {
          if (error) {
            callback(error);
          }
          callback(null, completedCount[0].completed_count / totalCount[0].cc);
        }
      );
    }
  );
};
