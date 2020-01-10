exports.getRegions = (req, res) => {
  const sql = "SELECT DISTINCT l.locality FROM locations as l;";
  global.conn.query(sql, (error, regions) => {
    if (error) {
      res.status(400).json({ success: false, message: error.message });
    } else {
      res.status(200).json({
        success: true,
        data: regions
      });
    }
  });
};
