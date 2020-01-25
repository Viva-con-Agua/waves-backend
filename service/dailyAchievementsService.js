exports.calculatePooleventOfTheDay = () => {
  setInterval(() => {
    fetchTodaysPe((error, pe) => {
      if (error) {
        console.log(error);
      }
      console.log(`${pe[0].user_id} created event of the day at ${new Date()}`);
      savePeTrophie(pe, (error, trophie) => {
        if (error) {
          console.log(error);
        }
        console.log(trophie);
      });
    });
  }, 100000 * 60 * 24);
};

const fetchTodaysPe = callback => {
  const sql =
    "select * from poolevents where DATE(`created_at`) = CURDATE() order by fave_count desc";
  global.conn.query(sql, (error, pe) => {
    if (error) {
      callback(error);
    }
    if (pe.length > 0) {
      callback(null, pe);
    }
  });
};

const savePeTrophie = (poolevents, callback) => {
  poolevents
    .slice(0, poolevents.length > 2 ? 3 : poolevents.length > 1 ? 2 : 1)
    .map((pe, i) => {
      global.conn.query(
        "insert into poolevent_trophies set ?",
        {
          poolevent_id: pe.id,
          trophie: i == 0 ? "GOLD" : i == 1 ? "SILVER" : "BRONZE"
        },
        (error, trophie) => {
          if (error) {
            callback(error);
          } else if (i == 2) {
            callback(null, trophie);
          }
        }
      );
    });
};
