const { initConnection } = require("../config/connectMysql");

exports.getNumOfPeByUserId = (userId, callback) => {
  try {
    const conn = initConnection();
    conn.query(
      "SELECT COUNT(*) as count FROM poolevents p WHERE user_id= ?;",
      userId,
      (error, numPoolevents) => {
        if (!error) {
          callback(null, numPoolevents);
        } else {
          callback(error);
        }
      }
    );
  } catch (error) {
    callback(error);
  }
};

exports.savePoolevent = (poolevent, callback) => {
  try {
    const conn = initConnection();
    const sql = "INSERT INTO poolevents SET ?;";
    conn.query(sql, poolevent ,(error, resp) => {
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
