const initConnection = require("../config/connectMysql").initConnection;

// @desc get all comments
// @route GET /api/v1/comment
// @access Private
//TODO: pagination + sorting
exports.getComments = (req, res) => {
  const conn = initConnection();
  conn.query(
    "SELECT * FROM comments p JOIN locations l ON p.id=l.comment_id JOIN descriptions d ON p.id=d.comment_id;",
    (error, comments) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: error.message
        });
      }
      res.status(200).json({
        success: true,
        data: comments
      });
    }
  );
};

// @desc get comment by id
// @route GET /api/v1/comment/:id
// @access Public
exports.getCommentById = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `SELECT * FROM comments p WHERE p.id='${id}';`,
    (err, comment) => {
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getcommentById: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: comment
        });
      }
    }
  );
};

// @desc  create comment
// @route POST /api/v1/comment
// @access Private
//TODO: desc
exports.postComment = (req, res) => {
  const { body } = req;
  let conn = initConnection();
  conn.query(`INSERT INTO comments SET ?`, body, (error, comment) => {
    if (error) {
      res.status(400).json({ success: false, messaage: error.message });
    } else {
      res.status(200).json({ success: true, data: comment });
    }
  });
};

// @desc delete comment by id
// @route DELETE /api/v1/comment/:id
// @access Private
exports.deleteComment = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `DELETE FROM  WHERE comments.id='${id}';`,
    (error, resp) => {
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
    }
  );
};

// @desc edit comment by id
// @route PUT /api/v1/comment/:id
// @access Private
exports.putComment = (req, res) => {
  const { body } = req;
  const { id } = req.params;
  const conn = initConnection();
  conn.query(
    `UPDATE comments SET ? WHERE id =${id};`,
    body,
    (error, resp) => {
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
    }
  );
};
