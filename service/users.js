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

exports.saveRoles = (roles, callback) => {
  try {
    const sql = "INSERT INTO roles SET ?;";
    roles.map((role, i) => {
      global.conn.query(sql, role, (error, resp) => {
        if (error) {
          callback(error);
        }
        if (roles.length - 1 == i) {
          callback(null, resp);
        }
      });
    });
  } catch (error) {
    callback(error);
  }
};

exports.updateRoles = (newRoles, user_id, callback) => {
  try {
    console.log(newRoles);
    global.conn.query(
      `select * from roles WHERE user_id='${user_id}'`,
      (error, roles) => {
        if (error) {
          callback(error);
        }
        console.log("-->", roles);
        roles.map((role, i) => {
          global.conn.query(
            `UPDATE roles SET ? WHERE idroles=${role.idroles}`,
            { role: newRoles[i].role },
            (error, resp) => {
              if (error) {
                callback(error);
              }
              if (roles.length - 1 == i) {
                callback(null, resp);
              }
            }
          );
        });
      }
    );
  } catch (error) {
    callback(error);
  }
};
exports.updateUser = (user, user_id, callback) => {
  try {
    const sql = `UPDATE users SET ? WHERE id="${user_id}";`;
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

exports.getRolesByUserId = (user_id, callback) => {
  try {
    const sql = `select r.role from roles r WHERE r.user_id='${user_id}';`;
    global.conn.query(sql, (error, resp) => {
      if (error) {
        callback(error);
      }
      callback(null, resp);
    });
  } catch (error) {
    callback(error);
  }
};
