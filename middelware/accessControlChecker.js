const AccessControl = require("accesscontrol");


const roles = (function() {
  const ac = new AccessControl();
  ac.grant("supporter")
    .createOwn("application")
    .deleteOwn("application")
    .readAny("poolevent")
    .grant("admin")
    .updateAny("poolevent")
    .deleteAny("poolevent")
    .createOwn("poolevent");

  return ac;
})();

exports.initAccessControl = async callback => {
  try {
    const ac = new AccessControl();
    let acc = roles
      .grant("supporter")
      .createOwn("application")
      .deleteOwn("application")
      .readAny("poolevent")
      .grant("admin")
      .updateAny("poolevent")
      .deleteAny("poolevent")
      .createOwn("poolevent");
    global.ac = await acc;
  } catch (error) {
    console.log(error);
  }
};

exports.checkAccessControl = (action, resource) => {
  return (req, res, callback) => {
    try {
      console.log(req.user.role);
      const permission = roles.can(req.user.role)[action](resource);
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
