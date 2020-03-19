exports.saveDescription = (description, callback) => {
  try {
    const sql = "INSERT INTO descriptions SET ?;";
    global.conn.query(sql, description, (error, resp) => {
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
