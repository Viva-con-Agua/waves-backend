const { saveNotification } = require("../service/notification");
const { validationResult } = require("express-validator");
const { checkChallengeComplete } = require("../service/gamification");
const { savePoolevent } = require("../service/poolevent");
const { saveLocation } = require("../service/location");
const { saveDescription } = require("../service/description");

// @desc get all poolevents
// @route GET /api/v1/poolevent
// @access Public
//TODO: pagination + sorting
exports.getPoolEvents = (req, res, next) => {
  let filter = "";
  let { limit, type, region, state } = req.query;
  if (!limit) {
    limit = 10;
  }

  if (state) {
    filter += `p.state="${state}"`;
  } else {
    filter += `p.state="RELEASED"`;
  }

  if (type) {
    filter += `AND p.idevent_type=${type}`;
  }

  if (region) {
    filter += ` AND l.locality="${region}"`;
  }

  const sql = `SELECT 
  p.id, 
  p.name,
  p.supporter_lim, 
  p.event_start,
  p.event_end,
  p.application_end, 
  l.route, 
  l.street_number,
  l.locality,
  l.postal_code,
  pt.name as type_name
  FROM poolevents p 
  JOIN locations l ON l.poolevent_id=p.id JOIN poolevent_types pt ON p.idevent_type=pt.idevent_type
  WHERE ${filter} LIMIT ${limit};`;
  global.conn.query(sql, (error, poolevents) => {
    if (error) {
      console.log(error);
      res.status(400).json({
        success: false,
        message: error.message
      });
    }

    res.status(200).json({
      success: true,
      data: poolevents
    });
  });
};

// @desc get poolevent by id
// @route GET /api/v1/poolevent/:id
// @access Public
exports.getPoolEventById = (req, res) => {
  const { id } = req.params;
  const sql = `SELECT *,pt.name as type_name, p.name as event_name FROM poolevents AS p  
              JOIN locations l ON p.id=l.poolevent_id 
              JOIN descriptions d ON d.poolevent_id=p.id
              JOIN poolevent_types pt ON pt.idevent_type=p.idevent_type
              WHERE p.id=${id};`;
  global.conn.query(sql, (err, poolevent) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getPoolEventById: ${err.message}`
      });
    } else {
      if (poolevent.length > 0) {
        const {
          asp_event_id,
          event_name,
          poolevent_id,
          route,
          street_number,
          country,
          type_name,
          locality,
          postal_code,
          desc,
          longitude,
          latitude,
          event_start,
          event_end,
          application_start,
          application_end,
          website,
          supporter_lim,
          state,
          text,
          html
        } = poolevent[0];

        res.status(200).json({
          success: true,
          data: {
            poolevent_id,
            event_name,
            type_name,
            event_start,
            event_end,
            application_start,
            application_end,
            website,
            supporter_lim,
            state,
            asp_event_id,
            location: {
              route,
              street_number,
              country,
              locality,
              postal_code,
              desc,
              longitude,
              latitude
            },
            description: {
              text,
              html
            }
          }
        });
      } else {
        res.status(400).json({ success: false, error: "Poolevent not found" });
      }
    }
  });
};

// @desc  create poolevent
// @route POST /api/v1/poolevent
// @access Private
//TODO: desc
exports.postPoolEvent = (req, res) => {
  const errors = validationResult(req);
  console.log(errors);
  if (!errors.isEmpty()) {
    return res.status(422).json({
      success: false,
      errors: errors.array()
    });
  }

  const { front, location, description } = req.body;
  front.user_id = req.user.id;
  savePoolevent(front, (error, pooleventResp) => {
    if (error) {
      res.status(400).json({
        message: error
      });
    }
    location.poolevent_id = pooleventResp.insertId;
    saveLocation(location, (error, locationResp) => {
      if (error) {
        res.status(400).json({
          message: error
        });
      }
      description.poolevent_id = pooleventResp.insertId;
      saveDescription(description, (error, descriptionResp) => {
        if (error) {
          res.status(400).json({ message: error });
        }
        saveNotification("poolevents", pooleventResp.insertId, error => {
          if (error) {
            res.status(400).json({ message: error });
          }
          checkChallengeComplete(
            "poolevents",
            req.user.id,
            (error, progress) => {
              if (error) {
                res.status(400).json({ message: error });
              }
              global.em.emit("NEW_POOLEVENT", pooleventResp.insertId);

              res.status(200).json({
                location: locationResp,
                poolevent: pooleventResp,
                description: descriptionResp
              });
            }
          );
        });
      });
    });
  });
};

// @desc delete poolevent by id
// @route DELETE /api/v1/poolevent/:id
// @access Private
exports.deletePoolEvent = (req, res) => {
  const { id } = req.params;
  global.conn.query(
    `DELETE FROM locations l WHERE l.poolevent_id=${id}`,
    (error, l) => {
      global.conn.query(
        `DELETE FROM descriptions d WHERE d.poolevent_id=${id}`,
        (error, d) => {
          global.conn.query(
            `DELETE FROM poolevents WHERE poolevents.id='${id} ';`,
            (error, resp) => {
              if (error) {
                res.status(400).json({
                  success: false,
                  message: `Error in deletePoolevent ${error.message}`
                });
              } else {
                res.status(200).json({
                  success: true,
                  data: resp
                });
              }
            }
          );
        }
      );
    }
  );
};

// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.putPoolEvent = (req, res) => {
  const { body } = req;
  const { id } = req.params;
  console.log("-->",body);
  global.conn.query(
    `UPDATE poolevents SET ? WHERE id =${id};`,
    body.front,
    (error, resp) => {
      if (error) {
        console.log(error);
        res.status(400).json({
          success: false,
          message: `Error in putPoolEvent: ${error.message}`
        });
      } else {
        if (body.location) {
          global.conn.query(
            `UPDATE locations set ? where poolevent_id=${id}`,
            body.location,
            (error, response) => {
              if (error) {
                console.log(error);
                res.status(400).json({
                  success: false,
                  message: `Error in putPoolEvent: ${error.message}`
                });
              }
            }
          );
          if (body.description) {
            global.conn.query(
              `UPDATE descriptions set ? where poolevent_id=${id}`,
              body.description,
              (error, response) => {
                if (error) {
                  console.log(error);
                  res.status(400).json({
                    success: false,
                    message: `Error in putPoolEvent: ${error.message}`
                  });
                }
                res.status(200).json({
                  success: true,
                  data: response
                });
              }
            );
          } else {
            res.status(200).json({
              success: true,
              data: response
            });
          }
        } else if (body.description) {
          global.conn.query(
            `UPDATE descriptions set ? where poolevent_id=${id}`,
            body.description,
            (error, response) => {
              if (error) {
                console.log(error);
                res.status(400).json({
                  success: false,
                  message: `Error in putPoolEvent: ${error.message}`
                });
              }
            }
          );
        } else {
          res.status(200).json({
            success: true,
            data: resp
          });
        }
      }
    }
  );
};

//TODO:
// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.getPoolEventByUserId = (req, res) => {
  const { id } = req.user;

  global.conn.query(
    `SELECT * FROM poolevents p 
    join locations l on l.poolevent_id=p.id 
    WHERE user_id='${id}';`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putPoolEvent: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};

//TODO:
// @desc edit poolevent by id
// @route PUT /api/v1/poolevent/:id
// @access Private
exports.getSoonStartingEvents = (req, res) => {
  global.conn.query(
    `select * from poolevents p order by event_start;`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putPoolEvent: ${error.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};
