const initConnection = require("../config/connectMysql").initConnection;

// @desc get Badge by id
// @route GET /api/v1/Badge/:id
// @access Public
exports.getAllBadges = (req, res) => {
  const { id } = req.user;
  const conn = initConnection();
  conn.query(
    `SELECT b.name, 
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
  conn.query(`INSERT INTO badges SET ?`, body, (error, Badge) => {
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
  conn.query(`DELETE FROM badges b WHERE b.id='${id}'`, (error, resp) => {
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
  });
};
