exports.initGamificationProfile = (req, res) => {
  try {
    const { userId } = req.params;
   global.conn.query("SELECT b.id FROM badges b;", async (error, badgeIds) => {
      const progress = await badgeIds.map(({ id }) => {
        return [JSON.parse(userId), id];
      });
     global.conn.query(
        "INSERT INTO badge_progress (user_id, badge_id) VALUES ?",
        [progress],
        (error, resp) => {
          if (error) {
            res.status(400).json({ 
                success: false, 
                message: error.message 
            });
          } else {
            res.status(200).json({ resp });
          }
        }
      );
    });
  } catch (error) {
    res.json(error);
  }
};
