exports.getAllUsersIds = callback => {
  const sql = "SELECT users.id FROM users";
  global.conn.query(sql, (error, rows) => {
    if (!error) {
      callback(null, rows);
    } else {
      callback(error);
    }
  });
};

exports.saveUser = (user, callback) => {
  try {
    const sql = "INSERT INTO users SET ?;";
    global.conn.query(sql, user, (error, resp) => {
      if (error) {
        callback(error);
      }
      callback(null, resp);
    });
  } catch (error) {
    callback(error);
  }
};

exports.getUserById = (id, callback) => {
  try {
    const sql = "SELECT * FROM users WHERE id=?;";
    global.conn.query(sql, id, (error, user) => {
      if (error) {
        callback(error);
      }
      callback(null, user);
    });
  } catch (error) {
    callback(error);
  }
};
