const express = require("express");
const cors = require('cors')
const dotenv = require("dotenv");
const morgan = require("morgan")("dev");
const bodyParser = require("body-parser");
const routes = require("./routes");
const connectDb = require("./config/dbConnector");
const connectMysql = require("./config/connectMysql");
const socket = require("./socket");


require("colors");

dotenv.config({ path: "./config/.env" });

connectDb();


const app = express();
var server = require('http').Server(app);
var io = require('socket.io')(server);

socket(io);

if (process.env.NODE_ENV == "dev") {
  app.use(morgan);
}

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
connectMysql.connectMysql()
app.use(cors());

app.get("/", (req, res) => {
  res.json({
    success: true,
    message: "i am alive!"
  });
});

app.use("/api/v1", routes);

const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(
    `App running in ${process.env.NODE_ENV} mode on port ${port}`.green.bold
  );
});
