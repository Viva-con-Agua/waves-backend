const jwt = require("jsonwebtoken");
const { fetchProfile, fetchToken } = require("../service/usersService");

const {
  updateRoles,
  updateUser,
  saveRoles,
  saveUser,
  getUserById
} = require("../service/usersService");
const {
  initNewUsersAchievements,
  checkProfileComplete,
  checkProfileVerified
} = require("../service/gamificationService");

exports.authenticate = async (req, res) => {
  try {
    const { code, state } = req.query;

    const s = await fetchToken(code);
    console.log("fetch token", s);
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
          access_token: s.access_token,
          refresh_token: s.refresh_token
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

              if (p.profile[0].supporter.roles) {
                res.cookie("CREW_ROLE", p.profiles[0].supporter.roles[0].name);
                res.cookie(
                  "CREW_CITY",
                  p.profiles[0].supporter.roles[0].crew.name
                );
              }

              let signed = jwt.sign(p, process.env.JWT_SECRET);
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
            access_token: s.access_token,
            refresh_token: s.refresh_token
          },
          p.id,
          (error, resp) => {
            if (error) {
              res.status(400).json({
                success: false,
                error: `update user error: ${error.message}`
              });
            }
            updateRoles(p.roles, p.id, (error, resp) => {
              if (error) {
                res.status(400).json({
                  success: false,
                  error: `update roles error: ${error.message}`
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
              if (p.profiles[0].supporter.roles.length) {
                res.cookie("CREW_ROLE", p.profiles[0].supporter.roles[0].name);
                res.cookie(
                  "CREW_CITY",
                  p.profiles[0].supporter.roles[0].crew.name
                );
              }
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
      error: error.message
    });
  }
};
