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

exports.setNotificationDirty = (notifications, callback) => {
  const conn = initConnection();
  notifications.map((notification, i) => {
    if (!notification.dirty) {
      const sql = `UPDATE notifications SET ? WHERE id=${notification.id}`;
      conn.query(sql, { dirty: 1 }, error => {
        if (!error && notifications.length - 1 == i) {
          callback();
        } else {
          throw error;
        }
      });
    } else {
      if (notifications.length - 1 == i) {
        callback();
      }
    }
  });
};

//TODO
exports.saveNotificationByUserId = userId => {
  const conn = initConnection();
  const sql = `INSERT INTO notifications SET ?`;
};

exports.getNonDirtyNotification = (user_id, callback) => {
  const conn = initConnection();
  const sql = `SELECT * FROM notifications n WHERE n.dirty=0 AND n.user_id=${user_id}`;
  conn.query(sql, (error, numNotification) => {
    if (!error) {
      callback(error, numNotification);
    } else {
      callback(error, numNotification);
    }
  });
};
