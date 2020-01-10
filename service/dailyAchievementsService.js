exports.calculatePooleventOfTheDay = () => {
  setInterval(() => {
    fetchTodaysPe((error, pe) => {
      if (error) {
        console.log(error);
      }
      console.log(`${pe.user_id} created event of the day at ${new Date()}`);
    });
  }, 10000 * 60 );
};

const fetchTodaysPe = callback => {
  const sql =
    "select * from poolevents where DATE(`created_at`) = CURDATE() order by fave_count desc";
  global.conn.query(sql, (error, pe) => {
    if (error) {
      callback(error);
    }
    if (pe.length > 0) {
      callback(null, pe[0]);
    }
  });
};
