const Axios = require("axios");
const { saveUser, getUserById } = require("../service/users");
const { initNewUsersAchievements } = require("../service/gamification");

exports.authenticate = async (req, res) => {
  try {
    const { code, state } = req.query;
    const s = await fetchToken(code);
    const p = await fetchProfile(s.access_token);
    console.log(p.profiles[0].supporter);
    getUserById(p.id, async (error, user) => {
      if (error) {
        res.status(400).json({
          success: false,
          error: error
        });
      }
      if (user.length <= 0) {
        await saveUser(
          {
            id: p.id,
            full_name: p.profiles[0].supporter.fullName.trim(),
            first_name: p.profiles[0].supporter.lastName.trim(),
            last_name: p.profiles[0].supporter.firstName.trim(),
            access_token: s.access_token,
            role: p.roles[0].role
          },
          (error, resp) => {
            if (error) {
              res.status(400).json({
                success: false,
                error: error
              });
            }
            initNewUsersAchievements(p.id, error => {
              if (error) {
                res.json(400).json({ success: false, error });
              }
              res.cookie("role", p.roles[0].role);
              res.cookie("full_name", p.profiles[0].supporter.fullName.trim());
              res.cookie("access_token", s.access_token).redirect(state);
            });
          }
        );
      } else {
        res.cookie("role", p.roles[0].role);
        res.cookie("full_name", p.profiles[0].supporter.fullName.trim());
        res.cookie("access_token", s.access_token).redirect(state);
      }
    });
  } catch (error) {
    res.status(400).json({
      success: false,
      error: error
    });
  }
};

const fetchToken = async code => {
  try {
    const { data } = await Axios.get(
      `https://stage.vivaconagua.org/drops/oauth2/access_token?grant_type=authorization_code&client_id=wavesex&code=${code}&redirect_uri=http://localhost/waves/api/v1/oauth`
    );
    return data;
  } catch (error) {
    throw error;
  }
};

const fetchProfile = async access_token => {
  try {
    const { data } = await Axios.get(
      "https://stage.vivaconagua.org/drops/oauth2/rest/profile?access_token=" +
        access_token
    );

    return data;
  } catch (error) {
    throw error;
  }
};

exports.receiveToken = (req, res) => {
  res.json({});
};
