const mysql = require("mysql");


const initConnection = ()=>{
  const conn = mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER_NAME,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
  });
  return conn;
}

const connectMysql = (next) => {
  try {
    const conn = mysql.createConnection({
        host: process.env.HOST,
        user: process.env.USER_NAME,
        password: process.env.PASSWORD,
        database: process.env.DATABASE,
      });
    conn.connect((err)=>{
        if(err) throw err;
        console.log('mysqlDb successfully connected');
    })
  } catch (error) {
    throw error;
  }
};

module.exports = {connectMysql, initConnection};