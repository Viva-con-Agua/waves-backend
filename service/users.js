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

exports.saveUser = (user, callback) => {
  try {
    const conn = initConnection();
    const sql = "INSERT INTO users SET ?;";
    conn.query(sql, user, (error, resp) => {
      if (error) {
        callback(error);
      }
      callback(null, resp);
    });
  } catch (error) {
    callback(error);
  }
};

exports.getUserById = (id, callback) => {
  try {
    const conn = initConnection();
    const sql = "SELECT * FROM users WHERE id=?;";
    conn.query(sql, id, (error, user) => {
      if (error) {
        callback(error);
      }
      callback(null, user);
    });
  } catch (error) {
    callback(error);
  }
};
