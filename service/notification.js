const initConnection = require("../config/connectMysql").initConnection;
const { getAllUsersIds } = require("../service/users");

exports.saveNotification = async notification => {
  getAllUsersIds(userIds => {
    const conn = initConnection();
    userIds.map(({ id }) => {
      notification.user_id = id;
      const sql = "INSERT INTO notifications SET ?";
      conn.query(sql, notification, (error, resp) => {
        if (error) {
          throw error;
        } else {
          return;
        }
      });
    });
  });
};

exports.saveBadgeNotificationByUserId = async (userId, badge) => {
  //Todo
};

exports.getNonDirtyNotification = (user_id, callback) => {
  const conn = initConnection();
  const sql = `SELECT * FROM notifications n 
               WHERE n.dirty=0 AND n.user_id=${user_id};`;
  conn.query(sql, (error, numNotification) => {
    if (!error) {
      callback(error, numNotification);
    } else {
      callback(error, numNotification);
    }
  });
};

exports.getDirtyNotification = (user_id, callback) => {
  try {
    const conn = initConnection();
    const sql = `SELECT * FROM notifications n 
                 WHERE dirty=1 AND user_id=${user_id};`;
    conn.query(sql, (error, notifications) => {
      if (!error) {
        callback(notifications);
      } else {
        callback(error, notifications);
      }
    });
  } catch (error) {
    callback(error);
  }
};

exports.sendNewBadge = data => {
  try {
    global.em.emit("NEW_BADGE", data);
  } catch (error) {
    throw error;
  }
};
