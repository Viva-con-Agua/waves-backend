const { initConnection } = require("../config/connectMysql");

exports.saveLocation = (location, callback) => {
  try {
    const conn = initConnection();
    const sql = "INSERT INTO locations SET ?;";
    conn.query(sql, location, (error, resp) => {
      if (!error) {
        callback(null, resp);
      } else {
        callback(error);
      }
    });
  } catch (error) {
    callback(error);
  }
};
