const mysql = require("mysql");

const initConnection = () => {
  const conn = mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER_NAME,
    password: process.env.PASSWORD,
    database: process.env.DATABASE
  });
  return conn;
};

const connectMysql = () => {
  try {
    const conn = mysql.createConnection(
      {
        host: process.env.HOST,
        user: process.env.USER_NAME,
        password: process.env.PASSWORD,
        database: process.env.DATABASE
      },
      { multipleStatements: true }
    );
    conn.connect(err => {
      if (err) throw err;
      console.log("db connected");
      global.conn = conn;
    });
  } catch (error) {
    throw error;
  }
};

module.exports = { connectMysql, initConnection };

/**
 * 
 * {
  "badges": [
    {
      "img": "//b.thumbs.redditmedia.com/loJzR3eUrPNvKw6g9RktAletCoQjMityx8emC5w83sw.png",
      "name": "Best Comment",
      "challenge": "Write a great comment",
      "type":"poolevents",
      "point":1
    },
    {
      "img": "//b.thumbs.redditmedia.com/TnRIsjez67SOHX-F7iW56rSNpbORu-0V6zsR92TV6Qc.png",
      "name": "Badge Designer",
      "challenge": "design a badge for vca",
      "type":"comments",
      "point":1
    },
    {
      "img": "//a.thumbs.redditmedia.com/uag6mXIzTCfMDaLAGr8IQ6PdPnVerANcJDIgPZDeDx0.png",
      "name": "New User",
      "challenge": "Join Pool",
      "type":"votes",
      "point":1
    },
    {
      "img": "//b.thumbs.redditmedia.com/xdKEqKiFPEtQPTvc0Qh_MoR-8y4IYkHnMajh27qhGjE.png",
      "name": "Verified Email Address",
      "challenge": "Verify your email address",
      "type":"applications",
      "point":1
    }
  ]
} 
 */