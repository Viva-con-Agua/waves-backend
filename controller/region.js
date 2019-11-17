const { initConnection } = require("../config/connectMysql");

exports.getRegions = (req, res) => {
  const conn = initConnection();
  const sql = "SELECT  DISTINCT l.city FROM wavesdb.locations l;";
  conn.query(sql, (error, regions) => {
    if (error) {
      res.status(400).json({ success: false, message: error.message });
    } else {
        res.status(200).json({
            success: true,
            data: regions
        })
    }
  });
};
