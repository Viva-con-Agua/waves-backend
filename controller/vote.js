const initConnection = require("../config/connectMysql").initConnection;
const { checkChallengeComplete } = require("../service/gamification");

// @desc get vote by id
// @route GET /api/v1/vote/:id
// @access Public
exports.getvoteByCommentId = (req, res) => {
  const { comment_id } = req.params;
  const conn = initConnection();
  conn.query(
    `SELECT * FROM votes p WHERE p.comment_id='${comment_id}'`,
    (err, votes) => {
      console.log(votes);
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getvoteId: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: votes
        });
      }
    }
  );
};

// @desc  create vote
// @route POST /api/v1/vote
// @access Private
//TODO: desc
exports.postvote = (req, res) => {
  const { body } = req;
  let conn = initConnection();
  conn.query(`INSERT INTO votes SET ?`, body, (error, vote) => {
    if (error) {
      res.status(400).json({ success: false, messaage: error.message });
    } else {
      checkChallengeComplete("votes", (error, resp) => {
        if (error) {
          res.status(400).json({ success: false, messaage: error.message });
        }
        res.status(200).json({ success: true, data: vote });
      });
    }
  });
};

// @desc delete vote by id
// @route DELETE /api/v1/vote/:id
// @access Private
exports.deletevote = (req, res) => {
  const { id } = req.params;
  const conn = initConnection();
  conn.query(`DELETE FROM votes WHERE votes.id='${id}'`, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        message: `Error in deletevote ${error.message}`
      });
    } else {
      res.status(200).json({
        success: true,
        data: resp
      });
    }
  });
};
