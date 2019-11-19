const { initConnection } = require("../config/connectMysql");
exports.countEntriesByTableName = (tableName, callback) => {
  const conn = initConnection();
  let sql = `SELECT COUNT(*) AS count FROM ${tableName}`;
  conn.query(sql, (error, count) => {
    if (error) {
      callback(error);
    }
    callback(null, error);
  });
};
