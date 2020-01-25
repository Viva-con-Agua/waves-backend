// @desc get vote by id
// @route GET /api/v1/vote/:id
// @access Public
exports.getTrophieByPeId = (req, res) => {
  const { id } = req.params;

  global.conn.query(
    `SELECT * FROM poolevent_trophies pt WHERE pt.poolevent_id='${id}'`,
    (err, trophie) => {
      if (err) {
        res.status(400).json({
          success: false,
          message: `Error in getTrophieByPeId: ${err.message}`
        });
      } else {
        res.status(200).json({
          success: true,
          trophie
        });
      }
    }
  );
};
