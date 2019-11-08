const { initConnection } = require("../config/connectMysql");
const {
  setNotificationDirty,
  getNonDirtyNotification
} = require("../service/notification");

exports.getNotificationByUserId = async (req, res) => {
  const { userId } = req.params;
  const { dirty } = req;
  const conn = initConnection();
  if (!dirty) {
    getNonDirtyNotification(userId, (error, notifications) => {
      if (!error) {
        res.status(200).json({
          success: true,
          data: notifications
        });
      } else {
        res.status(400).json({
          success: false,
          message: error.message
        });
      }
    });
  } else {
    const sql = `SELECT * FROM notifications n WHERE n.user_id=${userId}`;
    conn.query(sql, (error, notifications) => {
      if (!error) {
        setNotificationDirty(notifications, () => {
          res.status(200).json({
            success: true,
            data: notifications
          });
        });
      } else {
        res.status(400).json({
          success: false,
          message: error.message
        });
      }
    });
  }
};

exports.getDirtyNotifications = (req, res) => {};
