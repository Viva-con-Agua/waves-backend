const AccessControl = require("accesscontrol");

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
    .createOwn("comment");
  return ac;
})();

exports.checkAccessControl = (action, resource) => {
  return (req, res, callback) => {
    const { roles } = req.user;
    try {
      let r = "";
      if (roles.length > 1) {
        if (isAdmin()) {
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
          error: "You don't have enough permission to perform this action"
        });
      }
    } catch (error) {
      callback(error);
    }
  };
};

const isAdmin = async roles => {
  try {
    await roles.map(role => {
      if (role.role == "admin") {
        return true;
      }
    });
  } catch (error) {
    console.log(`Error in isAdmin: ${error.message}`);
  }
};
