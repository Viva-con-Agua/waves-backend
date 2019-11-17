const { initConnection } = require("../config/connectMysql");

exports.getNumOfPeByUserId = (userId, callback) => {
  try {
    const conn = initConnection();
    conn.query(
      "SELECT COUNT(*) as count FROM poolevents p WHERE user_id= ?;",
      userId,
      (error, numPoolevents) => {
        if (!error) {
          callback(null,numPoolevents)
        } else {
          callback(error)
        }
      }
    );
  } catch (error) {
    callback(error)
  }
};
