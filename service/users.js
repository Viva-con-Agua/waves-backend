const { initConnection } = require("../config/connectMysql");

exports.getAllUsersIds = callback => {
  const conn = initConnection();
  const sql = "SELECT users.id FROM users";
  conn.query(sql, (error, rows) => {
    if (!error) {
      callback(null, rows);
    } else {
      callback(error);
    }
  });
};
