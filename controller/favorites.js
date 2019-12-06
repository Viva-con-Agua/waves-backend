const initConnection = require("../config/connectMysql").initConnection;

// @desc get favorite by userId
// @route GET /api/v1/favorite/:id
// @access private
exports.getFavoriteByUserId = (req, res) => {
  const { user } = req;
  const conn = initConnection();
  const sql = `SELECT * FROM favorites f 
  JOIN poolevents p ON f.poolevent_id=p.id 
  WHERE f.user_id='${user.id}';`;
  conn.query(sql, (err, favorites) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getFavoriteByUserId: ${err.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: favorites
      });
    }
  });
};

// @desc  create favorite
// @route POST /api/v1/favorite
// @access Private
exports.postFavorite = (req, res) => {
  const { body, user } = req;
  let conn = initConnection();
  body.user_id = user.id;
  const sql = `INSERT INTO favorites SET ?`;
  conn.query(sql, body, (error, favorite) => {
    if (error) {
      res.status(400).json({
        success: false,
        messaage: error.message
      });
    } else {
      res.status(200).json({
        success: true,
        data: favorite
      });
    }
  });
};

// @desc delete favorite by id
// @route DELETE /api/v1/favorite/:id
// @access Private
exports.deleteFavorite = (req, res) => {
  const { id } = req.user;
  const conn = initConnection();
  const sql = `DELETE FROM favorites f WHERE f.poolevent_id='${id}';`;
  conn.query(sql, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletefavorite ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};
