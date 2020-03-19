const AccessControl = require("accesscontrol");
const { getPooleventById } = require("../service/pooleventService");
const { getApplicationById } = require("../service/applicationService");
const { fetchCrewByUserId } = require("../service/usersService");

const ac = (function() {
  const ac = new AccessControl();
  ac.grant("supporter")
    .readOwn("application")
    .createOwn("application")
    .deleteOwn("application")
    .readAny("poolevent")
    .readAny("comment")
    .updateOwn("comment")
    .deleteAny("comment")
    .createOwn("comment")
    .readAny("favorite")
    .updateAny("favorite")
    .deleteAny("favorite")
    .grant("admin")
    .readAny("poolevent")
    .updateAny("poolevent")
    .deleteAny("poolevent")
    .createAny("poolevent")
    .readAny("application")
    .updateAny("application")
    .deleteAny("application")
    .createOwn("application")
    .readAny("favorite")
    .updateAny("favorite")
    .deleteAny("favorite")
    .createOwn("event_type")
    .readAny("event_type")
    .updateAny("event_type")
    .createAny("event_type")
    .readAny("comment")
    .updateOwn("comment")
    .deleteAny("comment")
    .createOwn("comment")
    .grant("employee")
    .readAny("poolevent")
    .updateAny("poolevent")
    .deleteAny("poolevent")
    .createAny("poolevent")
    .readAny("application")
    .updateAny("application")
    .deleteAny("application")
    .createOwn("application")
    .readAny("favorite")
    .updateAny("favorite")
    .deleteAny("favorite")
    .createOwn("event_type")
    .readAny("event_type")
    .updateAny("event_type")
    .createAny("event_type")
    .readAny("comment")
    .updateOwn("comment")
    .deleteAny("comment")
    .createOwn("comment");

  return ac;
})();

exports.checkAccessControl = (action, resource) => {
  return (req, res, callback) => {
    const { roles } = req.user;

    try {
      let r = "";
      if (roles.length > 1) {
        if (isAdmin(roles)) {
          r = "admin";
        }
      } else if (roles.length == 1) {
        r = roles[0].role;
      } else {
        res.status(500).json({
          success: false,
          error: "internal server error"
        });
      }
      const permission = ac.can(r)[action](resource);
      if (permission.granted) {
        callback();
      } else {
        res.status(401).json({
          success: false,
          error: "Unauthorized"
        });
      }
    } catch (error) {
      callback(error);
    }
  };
};

const isAdmin = async roles => {
  try {
    let result = false;
    await roles.map(({ role }) => {
      if (role == "admin") {
        result = true;
      }
    });
    return result;
  } catch (error) {
    console.log(`Error in isAdmin: ${error.message}`);
  }
};

const isVolunteerManager = crewRole => {
  try {
    return { role: crewRole.name, city: crewRole.crew.name };
  } catch (error) {
    console.log(`Error in isAdmin: ${error.message}`);
  }
};

exports.pooleventAccessControl = async (req, res, next) => {
  let i = 0;
  try {
    const { roles } = req.user;
    if (isAdmin(roles)) {
      console.log(i++);
      return next();
    }
    const { id } = req.params;
    if (req.user.profiles[0].supporter.roles.length > 0) {
      console.log(i++);

      const crewRole = req.user.profiles[0].supporter.roles[0];
      isvm = isVolunteerManager(crewRole);
    } else {
      console.log(i++);

      res.status(403).json({ success: false, message: "unauthorized" });
    }
    if (id) {
      console.log(i++);

      getPooleventById(id, async (error, poolevent) => {
        if (error) {
          console.log(i++);

          console.log(error);
          res
            .status(500)
            .json({ success: false, message: "internal server error" });
        }
        if (!poolevent.length) {
          res.status(500).json({ success: false, message: "event not found" });
        }
        fetchCrewByUserId(poolevent[0].user_id, async (error, crew) => {
          console.log(i++);
          if (error) {
            console.log(error);
            console.log(i++);

            res.status(500).json({
              success: false,
              message: `internal message ${error.message}`
            });
          }
          if (isvm.role == "VolunteerManager" && isvm.city == crew) {
            console.log(i++);

            return next();
          }
        });
      });
    } else {
      console.log(i++);
      if (isvm.role == "VolunteerManager") {
        return next();
      }
    }
  } catch (error) {
    console.log(error);
    console.log(i++);

    res.status(500).json({ success: false, message: "internal server error" });
  }
};

exports.applicationAccessControl = (req, res, next) => {
  try {
    const { id } = req.params;
    console.log("id", id);
    getApplicationById(id, (error, application) => {
      if (error) {
        res
          .status(500)
          .json({ success: false, message: "internal server error" });
      }
      if (!application.length) {
        res
          .status(500)
          .json({ success: false, message: "application not found" });
      }
      getPooleventById(application[0].poolevent_id, (error, poolevent) => {
        if (error) {
          res.json({ success: false, message: "internal server error" });
        }
        if (!application.length) {
          res
            .status(500)
            .json({ success: false, message: "application not found" });
        }
        const crewRole = req.user.profiles[0].supporter.roles[0];
        const roles = req.user.roles;
        const isadmin = isAdmin(roles);
        const isvm = isVolunteerManager(crewRole);
        if (
          isadmin ||
          (isvm.role == "VolunteerManager" && poolevent[0].crew == isvm.city)
        ) {
          next();
        } else {
          console.log("scoop");
          res.status(403).json({ success: false, message: "Unauthorized" });
        }
      });
    });
  } catch (error) {
    res.status(500).json({ success: false, message: "internal server error" });
  }
};

/***
 * 
 * exports.pooleventAccessControl = async (req, res, next) => {
  try {
    const { id } = req.params;
    if (id) {
      getPooleventById(id, async (error, poolevent) => {
        if (error) {
          res
            .status(500)
            .json({ success: false, message: "internal server error" });
        }
        if (!poolevent.length) {
          res.status(500).json({ success: false, message: "event not found" });
        }
        fetchCrewByUserId(poolevent[0].user_id, async (error, crew) => {
          if (error) {
            res.status(500).json({
              success: false,
              message: `internal message ${error.message}`
            });
          }
          const roles = req.user.roles;
          const isadmin = await isAdmin(roles);
          if (isadmin) {
            next();
          }
          let isvm = undefined;
          console.log(req.user.profiles[0].supporter.roles);
          if (req.user.profiles[0].supporter.roles.length > 0) {
            const crewRole = req.user.profiles[0].supporter.roles[0];
            isvm = isVolunteerManager(crewRole);
            if (
              isvm.role == "VolunteerManager" &&
              isvm.city == crew
            ) {
              next();
            }
          } else {
            res.status(401).json({ success: false, message: "unauthorized" });
          }
        });
      });
    }
    const roles = req.user.roles;
    const isadmin = await isAdmin(roles);
    if (isadmin) {
      next();
    }
    let isvm = undefined;

    if (req.user.profiles[0].supporter.roles.length > 0) {
      const crewRole = req.user.profiles[0].supporter.roles[0];
      isvm = isVolunteerManager(crewRole);
      if (isvm.role == "VolunteerManager") {
        next();
      }
    } else {
      res.status(401).json({ success: false, message: "unauthorized" });
    }
  } catch (error) {
    res.status(500).json({ success: false, message: "internal server error" });
  }
};

 */
