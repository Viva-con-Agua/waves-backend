const Axios = require("axios");
const jwt = require("jsonwebtoken");

const {
  updateRoles,
  updateUser,
  saveRoles,
  saveUser,
  getUserById
} = require("../service/users");
const {
  initNewUsersAchievements,
  checkProfileComplete,
  checkProfileVerified
} = require("../service/gamification");

exports.authenticate = async (req, res) => {
  try {
    const { code, state } = req.query;
    const s = await fetchToken(code);
    //fetchProfile
    const p = await fetchProfile(s.access_token);
    const rls = p.roles.map(role => {
      return { role: role.role, user_id: p.id };
    });
    getUserById(p.id, async (error, user) => {
      if (error) {
        res.status(400).json({
          success: false,
          error: error
        });
      }
      if (user.length == 0) {
        const user = {
          id: p.id,
          full_name: p.profiles[0].supporter.fullName.trim(),
          first_name: p.profiles[0].supporter.lastName.trim(),
          last_name: p.profiles[0].supporter.firstName.trim(),
          access_token: s.access_token
        };
        await saveUser(user, (error, resp) => {
          if (error) {
            res.status(400).json({
              success: false,
              error: error
            });
          }
          saveRoles(rls, (error, roles) => {
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
              res.cookie(
                "roles",
                p.roles.length < 2 ? p.roles[0].role : p.roles[1].role
              );
              let signed = jwt.sign(p, process.env.JWT_SECRET);
              console.log(jwt);
              res.cookie("WAVES_JWT", signed);
              res.cookie("full_name", p.profiles[0].supporter.fullName.trim());
              res.cookie(
                "first_name",
                p.profiles[0].supporter.firstName.trim()
              );
              res.cookie("last_name", p.profiles[0].supporter.lastName.trim());
              res.cookie("access_token", s.access_token).redirect(state);
            });
          });
        });
      } else {
        updateUser(
          {
            full_name: p.profiles[0].supporter.fullName.trim(),
            first_name: p.profiles[0].supporter.lastName.trim(),
            last_name: p.profiles[0].supporter.firstName.trim(),
            access_token: s.access_token
          },
          p.id,
          (error, resp) => {
            if (error) {
              res.status(400).json({
                success: false,
                error: `update user error: ${error}`
              });
            }
            updateRoles(p.roles, p.id, (error, resp) => {
              if (error) {
                res.status(400).json({
                  success: false,
                  error: `update roles error: ${error}`
                });
              }
              checkProfileComplete(p.id);
              checkProfileVerified(p.id);
              res.cookie("user_id", p.id);
              res.cookie(
                "first_name",
                p.profiles[0].supporter.firstName.trim()
              );
              res.cookie(
                "roles",
                p.roles.length < 2 ? p.roles[0].role : p.roles[1].role
              );
              let signed = jwt.sign(p, process.env.JWT_SECRET);
              console.log(signed);

              res.cookie("WAVES_JWT", signed);
              res.cookie("last_name", p.profiles[0].supporter.lastName.trim());
              res.cookie("full_name", p.profiles[0].supporter.fullName.trim());
              res.cookie("access_token", s.access_token).redirect(state);
            });
          }
        );
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
      `${process.env.OAUTH_BASE_URI}/drops/oauth2/access_token?grant_type=authorization_code&client_id=${process.env.CLIENT_ID}&code=${code}&redirect_uri=${process.env.REDIRECT_URI}`
    );
    return data;
  } catch (error) {
    throw error;
  }
};

const fetchProfile = async access_token => {
  try {
    const { data } = await Axios.get(
      `${process.env.OAUTH_BASE_URI}/drops/oauth2/rest/profile?access_token=${access_token}`
    );
    console.log(data);
    const user = await Axios.post(
      "https://stage.vivaconagua.org/drops/rest/user/4a74141e-c2c0-46a0-9c0c-84bef8be7d0f?client_secret=waves&client_id=wavesex",
      {}
    );

    return user;
  } catch (error) {
    throw error;
  }
};
