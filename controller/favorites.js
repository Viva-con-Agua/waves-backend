const initConnection = require("../config/connectMysql").initConnection;

// @desc get favorite by userId
// @route GET /api/v1/favorite/:id
// @access private
exports.getFavoriteByUserId = (req, res) => {
  const { userId } = req.params;
  const conn = initConnection();
  const sql = `SELECT * FROM favorites WHERE favorites.user_id='${userId}';`;
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
//TODO: desc
exports.postFavorite = (req, res) => {
  const { body } = req;
  let conn = initConnection();
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
  const { id } = req.params;
  const conn = initConnection();
  const sql = `DELETE FROM favorites WHERE favorites.id='${id}';`;
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
