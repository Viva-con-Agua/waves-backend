const { initConnection } = require("../config/connectMysql");

exports.getAllMonths = (req, res) => {
  const conn = initConnection();
  const sql = `SELECT DISTINCT
    (MONTHNAME(p.event_start))
    FROM wavesdb.poolevents p;`;
  conn.query(sql, (error, months) => {
    if (error) {
      res.status(400).json({ success: false, message: error.message });
    } else {
        res.status(200).json({
            success: true,
            data: months
        })
    }
  });
};
