const { initConnection } = require("../config/connectMysql");

exports.postAchievement = (req, res) => {
  const { badge, challenge } = req.body.achievement;
  saveBadge(badge, (error, badgeResp) => {
    if (!error) {
      challenge.badge_id = badgeResp.insertId;
      saveChallenge(challenge, (error, challengeResp) => {
        if (!error) {
          initChallengeProgressForAllUsers(badgeResp.insertId, () => {
            res.status(200).json({
              success: true,
              data: {
                challengeResp,
                badgeResp
              }
            });
          });
        } else {
          res.status(400).json({
            success: false,
            message: error
          });
        }
      });
    } else {
      res.status(400).json({
        success: false,
        message: error
      });
    }
  });
};

const saveBadge = (badge, callback) => {
  const conn = initConnection();
  conn.query("INSERT INTO badges SET ?;", badge, (error, badge) => {
    if (!error) {
      callback(null, badge);
    } else {
      callback(error);
    }
  });
};

const saveChallenge = (challenge, callback) => {
  const conn = initConnection();
  conn.query("INSERT INTO challenges SET ?;", challenge, (error, challenge) => {
    if (!error) {
      callback(null, challenge);
    } else {
      callback(error);
    }
  });
};

const initChallengeProgressForAllUsers = (badgeId, callback) => {
  try {
    const conn = initConnection();
    conn.query("SELECT u.id AS user_id FROM users u ;", async (error, userIds) => {
        console.log(userIds);
      if (error) {
        callback(error);
      }
      const challengeProgress = await userIds.map(({ user_id }) => {
        return [user_id, badgeId];
      });
      console.log(challengeProgress);
      conn.query(
        "INSERT INTO badge_progress (user_id, badge_id) VALUES ?",
        [challengeProgress],
        (error, resp) => {
          if (error) {
            res.status(400).json({
              success: false,
              message: error.message
            });
          } else {
            callback(null, resp);
          }
        }
      );
    });
  } catch (error) {
    callback(error);
  }
};
