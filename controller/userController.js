const { initConnection } = require("../config/connectMysql");
const axios = require("axios");

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

exports.fetchUserById = (req, res) => {
  try {
    console.log("scoop");
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};
