exports.getNumOfPeByUserId = (userId, callback) => {
  try {
    global.conn.query(
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
    const sql = "INSERT INTO poolevents SET ?;";
    global.conn.query(sql, poolevent, (error, resp) => {
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

exports.incrementFaveCount = (id, callback) => {
  try {
    const sql = "UPDATE poolevents SET fave_count=fave_count+1 WHERE id=?;";
    global.conn.query(sql, id, (error, resp) => {
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

exports.getPooleventById = (id, callback) => {
  const sql = "SELECT * from poolevents WHERE id=?;";
  global.conn.query(sql, id, (error, poolevent) => {
    if (!error) {
      callback(null, poolevent);
    } else {
      callback(error);
    }
  });
};
