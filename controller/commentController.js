const { checkChallengeComplete } = require("../service/gamification");
// const NATS = require("nats");
// const nc = NATS.connect("nats://demo.nats.io:4222");

// @desc get comment by id
// @route GET /api/v1/comment/:id
// @access Public
exports.getCommentsByPooleventId = (req, res) => {
  const { pooleventId } = req.params;

  const sql = `SELECT c.text, c.id, c.created_at, 
              c.user_id,u.full_name, u.first_name,u.last_name 
              FROM comments c 
              JOIN users u ON c.user_id=u.id  
              WHERE c.poolevent_id='${pooleventId}' order by c.created_at desc;`;
  global.conn.query(sql, (err, comment) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getCommentsByPooleventId: ${err.message}`,
      });
    } else {
      res.status(200).json({
        success: true,
        data: comment,
      });
    }
  });
};

exports.getCommentsByUserId = (req, res) => {
  const { userId } = req.params;

  const sql = `SELECT c.text, c.id, c.created_at, c.poolevent_id,
              c.user_id,u.full_name, u.first_name,u.last_name, p.name AS poolevent_name
              FROM comments c 
              JOIN users u ON c.user_id=u.id  
              JOIN poolevents p ON c.poolevent_id=p.id  
              WHERE c.user_id='${userId}' order by c.created_at desc;`;
  global.conn.query(sql, (err, comment) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getCommentsByUserId: ${err.message}`,
      });
    } else {
      res.status(200).json({
        success: true,
        data: comment,
      });
    }
  });
};

exports.getCommentResponses = (req, res) => {
  const { commentId } = req.params;

  const sql = `SELECT c.text, c.id, c.created_at, 
              c.user_id,u.full_name, u.first_name,u.last_name 
              FROM comments c 
              JOIN users u ON c.user_id=u.id  
              WHERE c.comment_id='${commentId}' order by c.created_at desc;`;
  global.conn.query(sql, (err, comment) => {
    if (err) {
      res.status(400).json({
        success: false,
        message: `Error in getCommentResponses: ${err.message}`,
      });
    } else {
      res.status(200).json({
        success: true,
        data: comment,
      });
    }
  });
};

// @desc  create comment
// @route POST /api/v1/comment
// @access Private
exports.postComment = (req, res) => {
  const { body } = req;
  const { id } = req.user;
  body.user_id = id;
  const sql = `INSERT INTO comments SET ?`;
  global.conn.query(sql, body, (error, comment) => {
    if (error) {
      res.status(400).json({
        success: false,
        messaage: error.message,
      });
    } else {
      // nc.publish("comment.create", comment.insertId.toString());
      checkChallengeComplete("comments", id, (error, resp) => {
        if (error) {
          res.status(400).json({
            success: false,
            messaage: error.message,
          });
        }
        res.status(200).json({
          success: true,
          data: comment,
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

  global.conn.query(`DELETE FROM WHERE comments.id='${id}';`, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletecomment ${error.message}`,
      });
    } else {
      // nc.publish("comment.delete", id);
      res.status(200).json({
        success: true,
        data: resp,
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

  global.conn.query(
    `UPDATE comments SET ? WHERE id =${id};`,
    body,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in putcomment: ${error.message}`,
        });
      } else {
        // nc.publish("comment.edit", id);
        res.status(200).json({
          success: true,
          data: resp,
        });
      }
    }
  );
};

//TODO: getComments by user Id
