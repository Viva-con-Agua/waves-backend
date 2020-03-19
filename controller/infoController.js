exports.getInformation = (req, res) => {
  const { id } = req.user;
  const sql = `update badge_progress set ? 
  where user_id='${id}' 
  and type='info' 
  and completed=0;`;
  global.conn.query(sql, { completed: 1 }, (error, resp) => {
    if (error) {
      res.status(400).json({
        success: false,
        error
      });
    }
    res.status(200).json({
      info:
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nobis facere dolorum et suscipit cupiditate dolorem laborum quidem. Adipisci provident ab, magni illo velit natus sit illum iusto similique deserunt, libero non nobis, impedit praesentium! Id, reiciendis? Ipsa, quo tempore labore quidem debitis dicta! Saepe voluptatem sed omnis ab dolore neque."
    });
  });
};
