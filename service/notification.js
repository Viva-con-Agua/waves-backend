const { initConnection } = require("../config/connectMysql");
const { getAllUsersIds } = require("../service/users");

exports.saveNotification = (type, source_id, callback) => {
  console.log(type, source_id);
  const notification = { type };
  getAllUsersIds((error, userIds) => {
    if (error) {
      callback(error);
    }
    const conn = initConnection();
    userIds.map(({ id }, i) => {
      notification.user_id = id;
      const sql = "INSERT INTO notifications SET ?;";
      conn.query(sql, notification, (error, resp) => {
        if (error) {
          callback(error);
        }
        savePooleventNotification(
          type,
          {
            notification_type: "NEW",
            id: resp.insertId,
            source_id
          },
          (error, resp) => {
            if (userIds.length - 1 === i) {
              callback(null, resp);
            }
          }
        );
      });
    });
  });
};

const savePooleventNotification = (type, notification, callback) => {
  const conn = initConnection();
  console.log(notification);
  const sql = `INSERT INTO notification_${type} SET ?;`;
  conn.query(sql, notification, (error, resp) => {
    if (error) {
      callback(error);
    }
    callback(null, resp);
  });
};

exports.getNonDirtyNotification = (user_id, callback) => {
  const conn = initConnection();
  const sql = `SELECT * FROM notifications n 
               WHERE n.dirty=0 
               AND n.user_id=${user_id} ORDER by created_at ASC;`;
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
    const sql = `SELECT * FROM notifications n join notification_poolevents np on np.id=n.id
                  union all
                  SELECT * FROM notifications n join notification_badges nb on nb.id=n.id
                 WHERE user_id=${user_id};`;
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

exports.sendNewBadge = (data, callback) => {
  global.em.emit("NEW_BADGE", data);
  callback();
};
//'PE_RELEASED', 'PE_CANCELLED', 'NEW_COMMENT', 'NEW_VOTE', 'APPLICATION_REJECTED', 'APPLICATION_ACCEPETED', 'UNLOCKED_ACHIEVEMENT', 'NEW_ACHIEVEMENT_ADDED'
exports.getTableNameByNotificationType = type => {
  switch (type) {
    case "comm":
      return "poolevents";
    case "UNLOCKED_ACHIEVEMENT":
      return "badges";
    default:
      break;
  }
};
