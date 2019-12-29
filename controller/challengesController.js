// @desc get challenge by id
// @route GET /api/v1/challenge/:id
// @access Public
exports.getAllChallenges = (req, res) => {
  const { userId } = req.params;
  global.conn.query(
    `SELECT * FROM challenges b 
    JOIN badge_progress bp ON b.id=bp.badge_id 
    WHERE bp.user_id=${userId}`,
    (err, badges) => {
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getchallengeId: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          data: badges
        });
      }
    }
  );
};

// @desc  create challenge
// @route POST /api/v1/badge
// @access Private
//TODO: desc
exports.postchallenge = (req, res) => {
  const { body } = req;
  global.conn.query(
    `INSERT INTO challenges SET ?`,
    body,
    (error, challenge) => {
      if (error) {
        res.status(400).json({ success: false, messaage: error.message });
      } else {
        res.status(200).json({ success: true, data: challenge });
      }
    }
  );
};

// @desc delete challenge by id
// @route DELETE /api/v1/challenge/:id
// @access Private
exports.deletechallenge = (req, res) => {
  const { id } = req.params;
  global.conn.query(
    `DELETE FROM badges b WHERE b.id='${id}'`,
    (error, resp) => {
      if (error) {
        res.status(400).json({
          success: false,
          message: `Error in deletechallenge ${error.message}`
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
