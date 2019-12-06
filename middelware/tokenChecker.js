const { initConnection } = require("../config/connectMysql");

exports.verify = (req, res, next) => {
  try {
    const { authorization } = req.headers;
    const conn = initConnection();
    const [bearer, access_token] = authorization.split(" ");
    conn.query(
      `SELECT * FROM users WHERE access_token='${access_token}'`,
      (error, user) => {
        if (error) {
          res.status(400).json({ success: false, error: error });
        }
        if (user.length > 0) {
          req.user = user[0];
          next(null, user);
        } else {
          res.status(400).json({ success: false, error: `unauthorized` });
        }
      }
    );
  } catch (error) {
    if (error) {
      res.status(400).json({ success: false, error: error });
    }
  }
};
