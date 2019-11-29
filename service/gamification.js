const { initConnection } = require("../config/connectMysql");
const { countEntriesByTableName } = require("./abstractService");
const { sendNewBadge, saveNotification } = require("../service/notification");

//checks if a challenge is completed and fires a notification if so
exports.checkChallengeComplete = (type, callback) => {
  console.log(type);
  try {
    countEntriesByTableName(type, 1, (error, num) => {
      console.log(num);
      if (error) {
        callback(error);
      }
      updatePoints(num[0].count, 1, type, (error, resp) => {
        if (error) {
          callback(error);
        }
        joinChallengeOnProgress(1, type, (error, progress) => {
          if (error) {
            callback(error);
          }
          if (progress.length > 0) {
            setChallengeToCompleted(progress, (error, resp) => {
              if (!error) {
                sendNewBadge(progress, () => {
                  callback(null, resp);
                });
              } else {
                callback(error);
              }
            });
          } else {
            callback(null, progress);
          }
        });
      });
    });
  } catch (error) {
    callback(error);
  }
};

const joinChallengeOnProgress = (userId, type, callback) => {
  try {
    const conn = initConnection();
    const sql = `SELECT * FROM badge_progress bp 
    JOIN wavesdb.challenges c 
    ON c.badge_id=bp.badge_id AND c.points=bp.progress 
    WHERE bp.user_id=${userId} 
    AND c.type="${type}" 
    AND bp.completed=0;`;
    conn.query(sql, (error, progress) => {
      console.log("progress: ", progress);
      if (error) {
        callback(error);
      }
      callback(null, progress);
    });
  } catch (error) {
    callback(error);
  }
};

const updatePoints = (points, userId, type, callback) => {
  try {
    const conn = initConnection();
    const sql = `UPDATE badge_progress SET progress=? 
    WHERE user_id=${userId} AND type="${type}";`;
    conn.query(sql, points, (error, resp) => {
      console.log("updatePoints: ", resp, "type:", type);
      if (error) {
        callback(error);
      }
      callback(null, resp);
    });
  } catch (error) {
    callback(error);
  }
};

const setChallengeToCompleted = (challenges, callback) => {
  const conn = initConnection();
  challenges.map((challenge, i) => {
    const sql = `UPDATE  badge_progress SET ? 
      WHERE badge_id=${challenge.badge_id} 
      AND user_id=${challenge.user_id};`;
    conn.query(sql, { completed: 1 }, (error, badge) => {
      if (!error && challenges.length - 1 == i) {
        saveNotification(
          "UNLOCKED_ACHIEVEMENT",
          badge.insertId,
          (error, resp) => {
            if(error){callback(error)}
            console.log('savenot :', resp);
            callback(null, badge);
          }
        );
      } else {
        callback(error);
      }
    });
  });
};
