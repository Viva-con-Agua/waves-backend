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
  let { limit, type, region } = req.query;
  if (!limit) {
    limit = 10;
  }

  if (type) {
    filter += `AND p.type="${type.toUpperCase()}"`;
  }

  if (region) {
    filter += `AND l.city="${region}"`;
  }

  const sql = `SELECT 
  p.id, 
  p.name,
  p.supporter_lim, 
  p.event_start,
  p.type, 
  p.application_end, 
  l.street_name, 
  l.street_number,
  l.city,
  l.post_code 
  FROM poolevents p 
  JOIN locations l ON l.poolevent_id=p.id 
  WHERE p.state="RELEASED" ${filter} LIMIT ${limit};`;
  global.conn.query(sql, (error, poolevents) => {
    if (error) {
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
  const sql = `SELECT * FROM poolevents AS p  
              JOIN locations l ON p.id=l.poolevent_id 
              JOIN descriptions d ON d.poolevent_id=p.id 
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
          id,
          street_name,
          street_number,
          country,
          city,
          post_code,
          desc,
          long,
          lat,
          name,
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
            id,
            name,
            event_start,
            event_end,
            application_start,
            application_end,
            website,
            supporter_lim,
            state,
            location: {
              street_name,
              street_number,
              country,
              city,
              post_code,
              desc,
              long,
              lat
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

  if (!errors.isEmpty()) {
    return res.status(422).json({
      success: false,
      errors: errors.array()
    });
  }
  const { poolevent, location, description } = req.body;
  poolevent.user_id = req.user.id;
  savePoolevent(poolevent, (error, pooleventResp) => {
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
  global.conn.query(
    `UPDATE poolevents SET ? WHERE id =${id};`,
    body,
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
exports.getPoolEventByUserId = (req, res) => {
  const { id } = req.user;

  global.conn.query(
    `SELECT * FROM poolevents WHERE user_id='${id}';`,
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