const axios = require("axios");

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

exports.fetchUserById = async (user_id, callback) => {
  try {
    const { data } = await axios.post(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user/${user_id}?client_id=${process.env.CLIENT_ID}&client_secret=${process.env.CLIENT_SECRET}`,
      {}
    );
    callback(null, data);
  } catch (error) {
    callback(error.message);
  }
};

exports.fetchAllUsers = async (user_id, callback) => {
  try {
    const { data } = await axios.get(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user?client_id=${process.env.CLIENT_ID}&client_secret=${process.env.CLIENT_SECRET}`
    );
    callback(null, data);
  } catch (error) {
    callback(error.message);
  }
};

exports.fetchToken = async code => {
  try {
    const { data } = await axios.get(
      `${process.env.OAUTH_BASE_URI}/drops/oauth2/access_token?grant_type=authorization_code&client_id=${process.env.CLIENT_ID}&code=${code}&redirect_uri=${process.env.REDIRECT_URI}`
    );
    return data;
  } catch (error) {
    throw error;
  }
};

exports.fetchProfile = async (access_token) => {
  try {
    const { data } = await axios.get(
      `${process.env.OAUTH_BASE_URI}/drops/oauth2/rest/profile?access_token=${access_token}`
    );

    console.log("-->", data);

    console.log(
      `${process.env.OAUTH_BASE_URI}/drops/oauth2/rest/profile?access_token=${access_token}`
    );

    const user = await axios.post(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user/${data.id}?client_secret=waves&client_id=wavesex`,
      {}
    );
    return user.data;
  } catch (error) {
    throw error;
  }
};

exports.fetchCrewByUserId = (user_id, callback) => {
  try {
    this.fetchUserById(user_id, (error, user) => {
      if (error) {
        callback(error.message);
      }
      if (user) {
        let profiles = user.profiles[0];
        if (profiles.length > 0) {
          let supporter = profiles[0].supporter;
          if (supporter) {
            let crew = supporter.crew;
            if (crew) {
              callback(null, crew);
            }
          }
        }
      }
      return false;
    });
  } catch (error) {
    callback(error.message);
  }
};
