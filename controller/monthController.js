const { initConnection } = require("../config/connectMysql");

exports.getAllMonths = (req, res) => {
  const sql = `SELECT DISTINCT
    (MONTHNAME(p.event_start)) as month
    FROM wavesdb.poolevents p;`;
  global.conn.query(sql, async (error, months) => {
    if (error) {
      res.status(400).json({ success: false, message: error.message });
    } else {
      const result = await months.map(({ month }) => month);
      res.status(200).json({
        success: true,
        months: result
      });
    }
  });
};
