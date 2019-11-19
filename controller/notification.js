const { initConnection } = require("../config/connectMysql");
const {
  setNotificationDirty,
  getNonDirtyNotification,
  getDirtyNotification
} = require("../service/notification");

exports.getNotificationByUserId = async (req, res) => {
  try {
    const { userId } = req.params;
    const conn = initConnection();
    const sql = `SELECT n.type,n.created_at, p.name 
    FROM notifications n 
    JOIN poolevents p ON p.id=n.poolevent_id 
    WHERE n.user_id=? ORDER BY n.created_at DESC LIMIT 10;`;
    conn.query(sql, userId, (error, notifications) => {
      if (!error) {
        conn.query(
          `UPDATE notifications SET ? 
          WHERE user_id=${userId} AND dirty=0;`,
          { dirty: 1 },
          (error, resp) => {
            res.status(200).json({
              success: true,
              data: notifications
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
      message: error.message
    });
  }
};

exports.getNewNotificationsByUserId = (req, res) => {
  try {
    const { userId } = req.params;
    const conn = initConnection();
    const sql = `SELECT * FROM notifications WHERE user_id=${userId} AND dirty=0;`;
    conn.query(sql, (error, newNotifications) => {
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
  } catch (error) {}
};

exports.getDirtyNotifications = (req, res) => {};
