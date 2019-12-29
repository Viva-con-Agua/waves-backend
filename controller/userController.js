const { initConnection } = require("../config/connectMysql");

exports.getAllUsers = (req, res) => {
  const conn = initConnection();
 global.conn.query(`SELECT u.id, u.last_name FROM users u;`, (err, users) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getvoteId: ${err.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: users
      });
    }
  });
};
