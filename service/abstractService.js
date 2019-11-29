const { initConnection } = require("../config/connectMysql");
exports.countEntriesByTableName = (tableName, userId, callback) => {
  const conn = initConnection();
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  conn.query(sql, userId, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, count);
  });
};

exports.joinNotificationOnTablename = (tableName, userId, callback) => {
  const conn = initConnection();
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  conn.query(sql, userId, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, count);
  });
};