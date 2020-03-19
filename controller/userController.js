const axios = require("axios");

exports.getAllUsers = (req, res) => {
  global.conn.query(`SELECT u.id, u.last_name FROM users u;`, (err, users) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getvoteId: ${err.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: users
      });
    }
  });
};

exports.fetchUserById = async (req, res) => {
  try {
    const { data } = await axios.post(
      `${process.env.OAUTH_BASE_URI}/drops/rest/user/${req.params.id}?client_id=${process.env.CLIENT_ID}&client_secret=${process.env.CLIENT_SECRET}`,
      {}
    );
    res.status(200).json({ success: true, user: data });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};
