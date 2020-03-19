const axios = require("axios");
exports.getApplicationById = (id, callback) => {
  const sql = "SELECT * FROM applications where id=?";
  global.conn.query(sql, id, (error, rows) => {
    if (!error) {
        console.log(rows);
      callback(null, rows);
    } else {
      callback(error);
    }
  });
};
