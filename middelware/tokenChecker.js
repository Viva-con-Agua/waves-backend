const { getRolesByUserId, fetchProfile } = require("../service/usersService");

exports.verifyX = async (req, res, next) => {
  try {
    const { authorization } = req.headers;
    if (authorization) {
      const [bearer, access_token] = await authorization.split(" ");
      if (access_token === null) {
        res.status(401).json({
          success: false,
          error: "unauthorized, access token required"
        });
      }
      const profile = await fetchProfile(access_token);
      req.user = profile;
      return next(null, profile);
    } else {
      res.status(401).json({
        success: false,
        error: "unauthorized, access token required"
      });
    }
  } catch (error) {
    res.status(401).json({
      success: false,
      error: "unauthorized: token expired"
    });
  }
};

exports.verify = async (req, res, next) => {
  try {
    const { authorization } = req.headers;
    const [bearer, access_token] = await authorization.split(" ");
    if (!access_token) {
      rs.status(400).json({
        success: false,
        error: "unauthorized, access token required"
      });
    }
    conn.query(
      `SELECT * FROM users WHERE access_token='${access_token}'`,
      (error, user) => {
        if (error) {
          res.status(400).json({ success: false, error: error });
        }
        if (user.length > 0) {
          getRolesByUserId(user[0].id, (error, roles) => {
            if (error) {
              res.status(400).json({
                success: false,
                error: `error in verify token: ${error.message}`
              });
            }
            req.user = { roles, ...user[0] };
            next(null, user);
          });
        } else {
          res.status(400).json({ success: false, error: `unauthorized` });
        }
      }
    );
  } catch (error) {
    if (error) {
      res.status(400).json({
        success: false,
        error: `error in verify token: ${error.message}`
      });
    }
  }
};
