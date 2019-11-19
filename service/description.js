const { initConnection } = require("../config/connectMysql");

exports.saveDescription = (description, callback) => {
  try {
    const conn = initConnection();
    const sql = "INSERT INTO descriptions SET ?;";
    conn.query(sql, description, (error, resp) => {
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
