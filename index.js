const connectMysql = require("./config/connectMysql");
const eventEmitter = require("./service/eventEmitter");
const bodyParser = require("body-parser");
const morgan = require("morgan")("dev");
const express = require("express");
const routes = require("./routes");
const socket = require("./socket");
const dotenv = require("dotenv");
const cors = require("cors");

require("colors");

dotenv.config({ path: "./config/.env" });

const app = express();
var server = require("http").Server(app);
var io = require("socket.io")(server);

socket(io);
eventEmitter();

if (process.env.NODE_ENV == "dev") {
  app.use(morgan);
}

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
connectMysql.connectMysql();
app.use(cors());

app.use("/waves/api/v1", routes);

const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(
    `App running in ${process.env.NODE_ENV} mode on port ${port}`.green.bold
  );
});

