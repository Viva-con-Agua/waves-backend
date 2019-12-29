exports.saveLocation = (location, callback) => {
  try {
    const sql = "INSERT INTO locations SET ?;";
    global.conn.query(sql, location, (error, resp) => {
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
