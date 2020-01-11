exports.postPeType = (req, res) => {
  const { body } = req;
  global.conn.query(
    "insert into poolevent_types set ?",
    body,
    (error, type) => {
      if (error) {
      }
      res.json({ success: true, type });
    }
  );
};

exports.getAllPeType = (req, res) => {
  global.conn.query("select * from poolevent_types;", (error, types) => {
    if (error) {
      res.status(400).json({ success: false, error });
    }
    res.status(200).json({ success: true, types });
  });
};

exports.deletePeType = (req, res) => {};

exports.putPeType = (req, res) => {};
