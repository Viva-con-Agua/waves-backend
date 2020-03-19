const { getAllUsersIds } = require("./usersService");

exports.saveNotification = (type, source_id, callback) => {
  try {
    console.log(type, source_id);
    const notification = { type };
    getAllUsersIds((error, userIds) => {
      if (error) {
        callback(error);
      }

      userIds.map(({ id }, i) => {
        notification.user_id = id;
        console.log(notification);
        const sql = "INSERT INTO notifications SET ?;";
        global.conn.query(sql, notification, (error, resp) => {
          if (error) {
            console.log("-->", error.message);

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
              if (error) {
                console.log("-->", error.message);

                callback(error);
              }
              if (userIds.length - 1 === i) {
                callback(null, resp);
              }
            }
          );
        });
      });
    });
  } catch (error) {
    callback(error);
  }
};

const savePooleventNotification = (type, notification, callback) => {
  console.log(notification);
  const sql = `INSERT INTO notification_${type} SET ?;`;
  global.conn.query(sql, notification, (error, resp) => {
    if (error) {
      callback(error);
    }
    callback(null, resp);
  });
};

exports.getNonDirtyNotification = (user_id, callback) => {
  const sql = `SELECT * FROM notifications n 
               WHERE n.dirty=0 
               AND n.user_id="${user_id}" ORDER by created_at ASC;`;
  global.conn.query(sql, (error, numNotification) => {
    if (!error) {
      callback(error, numNotification);
    } else {
      callback(error, numNotification);
    }
  });
};

exports.getDirtyNotification = (user_id, callback) => {
  try {
    const sql = `SELECT * FROM notifications n join notification_poolevents np on np.id=n.id
                  union all
                  SELECT * FROM notifications n join notification_badges nb on nb.id=n.id
                 WHERE user_id="${user_id}";`;
    global.conn.query(sql, (error, notifications) => {
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
  try {
    global.conn.query(
      `select * from badges where id=${data[0].badge_id}`,
      (error, badge) => {
        console.log(badge);
        if (error) {
          console.log(error);
          callback(error)
        }
        global.em.emit("NEW_BADGE", badge[0]);
        callback();
      }
    );  
  } catch (error) {
    console.log(error);
    callback(error)
  }
  
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

exports.saveNotificationByUser = (
  user_id,
  desc,
  type,
  source_id,
  trigger_id,
  callback
) => {
  global.conn.query(
    "INSERT INTO notifications SET ?",
    {
      user_id,
      desc,
      source_id,
      trigger_id,
      type
    },
    (error, resp) => {
      if (error) {
        callback(error);
      }
      global.conn.query(
        `INSERT INTO notification_${type} SET ?`,
        {
          id: resp.insertId,
          notification_type: "NEW",
          source_id
        },
        (error, resp) => {
          if (error) {
            callback(error);
          }
          callback(null, resp);
        }
      );
    }
  );
};
