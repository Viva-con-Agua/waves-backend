const mongoose = require("mongoose");

const connectDb = async () => {
  try {
    const conn = await mongoose.connect(
      `mongodb+srv://${process.env.BILAL_DB_USERNAME}:${process.env.BILAL_DB_PW}@cluster0-5skj7.mongodb.net/test?retryWrites=true&w=majority`,
      {
        useNewUrlParser: true,
        useCreateIndex: true,
        useFindAndModify: false,
        useUnifiedTopology: true
      }
    );
    console.log(`Mongodb connected ${conn.connection.host}`.yellow);
  } catch (error) {
    console.log("DB connection failed: ", error);
  }
};

module.exports = connectDb;