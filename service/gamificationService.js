const { countEntriesByTableName } = require("./abstractService");
const {
  sendNewBadge,
  saveNotificationByUser
} = require("./notificationService");

//checks if a challenge is completed and fires a notification if so
exports.checkChallengeComplete = (type, userId, callback) => {
  try {
    countEntriesByTableName(type, userId, (error, num) => {
      if (error) {
        console.log("-->", error.message);

        callback(error);
      }
      updatePoints(num[0].count, userId, type, (error, resp) => {
        if (error) {
          console.log("-->", error.message);

          callback(error);
        }
        joinChallengeOnProgress(userId, type, (error, progress) => {
          if (error) {
            console.log("-->", error.message);

            callback(error);
          }
          if (progress.length > 0) {
            setChallengeToCompleted(progress, (error, resp) => {
              if (!error) {
                console.log("-->", error.message);
                
                sendNewBadge(progress, (error,resp) => {
                  if(error){
                    console.log(error);
                    callback(error)

                  }
                  callback(null, resp);
                });
              } else {
                console.log("-->", error.message);

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
    console.log(error.message);
    callback(error);
  }
};

const joinChallengeOnProgress = (userId, type, callback) => {
  try {
    const sql = `SELECT * FROM badge_progress bp 
    JOIN challenges c 
    ON c.badge_id=bp.badge_id AND c.points=bp.progress 
    WHERE bp.user_id="${userId}" 
    AND c.type="${type}" 
    AND bp.completed=0;`;
    global.conn.query(sql, (error, progress) => {
      if (error) {
        console.log(error.message);
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
    const sql = `UPDATE badge_progress SET progress=? 
    WHERE user_id="${userId}" AND type="${type}" AND completed=0;`;
    global.conn.query(sql, points, (error, resp) => {
      if (error) {
        callback(error);
      }
      callback(null, resp);
    });
  } catch (error) {
    console.log(error);

    callback(error);
  }
};

const setChallengeToCompleted = (challenges, callback) => {
  challenges.map((challenge, i) => {
    const sql = `UPDATE  badge_progress SET ? 
      WHERE badge_id=${challenge.badge_id} 
      AND user_id="${challenge.user_id}";`;
    global.conn.query(sql, { completed: 1 }, (error, badge) => {
      if (!error && challenges.length - 1 == i) {
        saveNotificationByUser(
          challenge.user_id,
          "",
          "badges",
          challenge.badge_id,
          challenge.user_id,
          (error, resp) => {
            if (error) {
              console.log(error.message);

              callback(error);
            }

            callback(null, badge);
          }
        );
      } else {
        console.log(error.message);

        callback(error);
      }
    });
  });
};

exports.initNewUsersAchievements = (userId, callback) => {
  getAllChallenges(async (error, challenges) => {
    console.log(error.message);

    const challengeProgress = await challenges.map(({ badge_id, type }) => {
      return [userId, badge_id, type];
    });

    if (challengeProgress.length > 0) {
      global.conn.query(
        "INSERT INTO badge_progress (user_id, badge_id,type) VALUES ?",
        [challengeProgress],
        (error, resp) => {
          if (error) {
            callback(error);
          } else {
            callback(null, resp);
          }
        }
      );
    } else {
      callback(null, {});
    }
  });
};

const getAllChallenges = callback => {
  const selectAllChallenges = "SELECT * FROM challenges;";
  global.conn.query(selectAllChallenges, (error, challenges) => {
    if (error) {
      console.log(error.message);

      callback(error);
    } else {
      callback(null, challenges);
    }
  });
};

exports.checkProfileComplete = userId => {
  global.conn.query(
    `SELECT * FROM users WHERE id="${userId}"`,
    (error, user) => {
      if (error) {
        console.log(error);
        callback(error);
      }
      let values = Object.values(user[0]);
      const filtered = values.filter(
        value =>
          value == null || value == undefined || value == "" || value == ""
      );
      global.conn.query(
        `UPDATE badge_progress SET ? 
        WHERE user_id="${userId}" 
        and type="profiles"`,
        { progress: values.length - filtered.length },
        (error, progress) => {
          console.log(error, progress);
          joinChallengeOnProgress(userId, "profiles", (error, joined) => {
            if (error) {
              callback(error);
            }
            console.log(error, joined);
            if (joined > 0) {
              setChallengeToCompleted(joined, (error, complete) => {
                if (error) {
                  callback(error);
                }
                console.log(error, complete);
              });
            }
          });
        }
      );
    }
  );
};

exports.checkProfileVerified = userId => {
  global.conn.query(
    `SELECT * FROM users WHERE id="${userId}"`,
    (error, user) => {
      if (error) {
        console.log(error);
        callback(error)
      }
      if (user.length > 0) {
        if (user[0].verified) {
          console.log("verified");
        }
      }
    }
  );
};
