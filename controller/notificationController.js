const { initConnection } = require("../config/connectMysql");

exports.getNotificationByUserId = async (req, res) => {
  try {
    const { id } = req.user;
    let { limit } = req.query;
    if (!limit) {
      limit = 6;
    }
    const sql = `SELECT * FROM notifications n 
    join notification_poolevents np 
    on np.id=n.id
    WHERE n.user_id='${id}' 
    union all
    SELECT * FROM notifications n 
    join notification_badges nb 
    on nb.id=n.id 
    WHERE n.user_id=? order by created_at desc LIMIT ${limit}`;
    global.conn.query(sql, id, (error, notifications) => {
      if (!error) {
        global.conn.query(
          `UPDATE notifications SET ? 
          WHERE user_id='${id}' AND dirty=0;`,
          { dirty: 1 },
          (error, resp) => {
            if (error) {
              res.status(400).json({
                success: false,
                message: error
              });
            }
            resolveIds(notifications, (error, resolvedNotification) => {
              if (error) {
                res.status(400).json({
                  success: false,
                  message: error
                });
              }

              res.status(200).json({
                success: true,
                data: resolvedNotification
              });
            });
          }
        );
      } else {
        res.status(400).json({
          success: false,
          message: error
        });
      }
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error
    });
  }
};

const resolveIds = (notifications, callback) => {
  let res = [];
  notifications.map((notification, i) => {
    let sql = `select r.name, r.type from ${notification.type} r WHERE id=${notification.source_id}`;
    global.conn.query(sql, (error, resource) => {
      if (error) {
        callback(error);
      } else {
        res.push({ notification, source: resource[0] });
        if (notifications.length - 1 == i) {
          callback(null, res);
        }
      }
    });
  });
};

exports.getNewNotificationsByUserId = (req, res) => {
  try {
    const { id } = req.user;
    const sql = `SELECT * FROM notifications WHERE user_id='${id}' AND dirty=0;`;
    global.conn.query(sql, (error, newNotifications) => {
      if (!error) {
        res.status(200).json({
          success: true,
          data: newNotifications
        });
      } else {
        res.status(400).json({
          success: false,
          message: error.message
        });
      }
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message
    });
  }
};
