const { initConnection } = require("../config/connectMysql");
exports.getInformation = (req, res) => {
  const connt = initConnection();
  const sql =
    "insert into badge_progress set ? where user_id=1 and type=onboarding;";
  connt.query(sql, { completed: 1 }, (error, resp) => {
    res.status(200).json({
      info:
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nobis facere dolorum et suscipit cupiditate dolorem laborum quidem. Adipisci provident ab, magni illo velit natus sit illum iusto similique deserunt, libero non nobis, impedit praesentium! Id, reiciendis? Ipsa, quo tempore labore quidem debitis dicta! Saepe voluptatem sed omnis ab dolore neque."
    });
  });
};
