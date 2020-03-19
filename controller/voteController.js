const { checkChallengeComplete } = require("../service/gamification");
const NATS = require("nats");
const nc = NATS.connect(process.env.nats_server);
// @desc get vote by id
// @route GET /api/v1/vote/:id
// @access Public
exports.getvoteByCommentId = (req, res) => {
  const { comment_id } = req.params;

  global.conn.query(
    `SELECT * FROM votes p WHERE p.comment_id='${comment_id}'`,
    (err, votes) => {
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
  const { id } = req.user;
  body.user_id = id;

  global.conn.query(`INSERT INTO votes SET ?`, body, (error, vote) => {
    if (error) {
      res.status(400).json({ success: false, messaage: error.message });
    } else {
      checkChallengeComplete("votes", id, (error, resp) => {
        if (error) {
          res.status(400).json({ success: false, messaage: error.message });
        }
        nc.publish("vote.create", vote.insertId.toString());
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

  global.conn.query(
    `DELETE FROM votes WHERE votes.id='${id}'`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deletevote ${error.message}`
        });
      } else {
        nc.publish("vote.delete", id);
        res.status(200).json({
          success: true,
          data: resp
        });
      }
    }
  );
};
