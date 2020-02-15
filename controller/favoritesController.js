const { incrementFaveCount } = require("../service/pooleventService");
// @desc get favorite by userId
// @route GET /api/v1/favorite/:id
// @access private
exports.getFavoriteByUserId = (req, res) => {
  const { user } = req;
  const sql = `SELECT l.*, pt.*,p.id,p.name,p.website,p.event_start,p.event_end FROM favorites f 
  JOIN poolevents p ON f.poolevent_id=p.id 
  join locations l on l.poolevent_id=p.id
  join poolevent_types pt on p.idevent_type=pt.idevent_type
  WHERE f.user_id='${user.id}';`;
  global.conn.query(sql, (err, favorites) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getFavoriteByUserId: ${err.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: favorites
      });
    }
  });
};

// @desc  create favorite
// @route POST /api/v1/favorite
// @access Private
exports.postFavorite = (req, res) => {
  const { body, user } = req;
  body.user_id = user.id;
  const sql = `INSERT INTO favorites SET ?`;
  global.conn.query(sql, body, (error, favorite) => {
    if (error) {
      res.status(400).json({
        success: false,
        messaage: error.message
      });
    } else {
      incrementFaveCount(body.poolevent_id, (error, resp) => {
        if (error) {
          res.status(400).json({
            success: false,
            messaage: error.message
          });
        }
        res.status(200).json({
          success: true,
          data: favorite
        });
      });
    }
  });
};

// @desc delete favorite by id
// @route DELETE /api/v1/favorite/:id
// @access Private
exports.deleteFavorite = (req, res) => {
  const { id } = req.user;
  const sql = `DELETE FROM favorites f WHERE f.poolevent_id='${id}';`;
  global.conn.query(sql, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletefavorite ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};

// @desc delete favorite by id
// @route DELETE /api/v1/favorite/:id
// @access Private
exports.getMostFavedPoolevents = (req, res) => {
  const sql = `select *, pt.name as type_name ,p.name as pe_name from poolevents p 
  join poolevent_types pt on pt.idevent_type = p.idevent_type
  where p.state="released"
  order by 
  p.fave_count desc LIMIT 10;`;
  global.conn.query(sql, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `getMostFavedPoolevents ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        recomandations: resp
      });
    }
  });
};
