exports.countEntriesByTableName = (tableName, userId, callback) => {
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  global.conn.query(sql, userId, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, count);
  });
};

exports.joinNotificationOnTablename = (tableName, userId, callback) => {
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}
  WHERE user_id=?`;
  global.conn.query(sql, userId, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, count);
  });
};
