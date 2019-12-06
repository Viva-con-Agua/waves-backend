const initConnection = require("../config/connectMysql").initConnection;
const { checkChallengeComplete } = require("../service/gamification");

// @desc get comment by id
// @route GET /api/v1/comment/:id
// @access Public
exports.getCommentsByPooleventId = (req, res) => {
  const { pooleventId } = req.params;
  const conn = initConnection();
  const sql = `SELECT c.text, c.id, c.created_at, 
              c.user_id, u.first_name,u.last_name 
              FROM comments c 
              JOIN users u ON c.user_id=u.id 
              WHERE c.poolevent_id='${pooleventId}';`;
  conn.query(sql, (err, comment) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getCommentsByPooleventId: ${err.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: comment
      });
    }
  });
};

// @desc  create comment
// @route POST /api/v1/comment
// @access Private
//TODO: desc
exports.postComment = (req, res) => {
  const { body } = req;
  const { id } = req.user;
  body.user_id = id;
  console.log(body);
  let conn = initConnection();
  const sql = `INSERT INTO comments SET ?`;
  conn.query(sql, body, (error, comment) => {
    if (error) {
      res.status(400).json({
        success: false,
        messaage: error.message
      });
    } else {
      checkChallengeComplete("comments", id, (error, resp) => {
        if (error) {
          res.status(400).json({
            success: false,
            messaage: error.message
          });
        }
        res.status(200).json({
          success: true,
          data: comment
        });
      });
    }
  });
};

// @desc delete comment by id
// @route DELETE /api/v1/comment/:id
// @access Private
exports.deleteComment = (req, res) => {
  const { id } = req.user;
  const conn = initConnection();
  conn.query(`DELETE FROM WHERE comments.id='${id}';`, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletecomment ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};

// @desc edit comment by id
// @route PUT /api/v1/comment/:id
// @access Private
exports.putComment = (req, res) => {
  const { body } = req;
  const { id } = req.user;
  body.user_id = id;
  const conn = initConnection();
  conn.query(`UPDATE comments SET ? WHERE id =${id};`, body, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in putcomment: ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};

//TODO: getComments by user Id
