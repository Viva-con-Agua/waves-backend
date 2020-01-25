const { connectMysql } = require("./config/connectMysql");
const eventEmitter = require("./service/eventEmitter");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const morgan = require("morgan")("dev");
const express = require("express");
const poolevent = require("./routes/poolevent");
const application = require("./routes/application");
const comment = require("./routes/comment");
const vote = require("./routes/vote");
const notification = require("./routes/notification");
const eventtype = require("./routes/pooleventType");
const favorite = require("./routes/favorite");
const month = require("./routes/month");
const trophie = require("./routes/trophies");
const routes = require("./routes/index");

const user = require("./routes/user");
const socket = require("./socket");
const dotenv = require("dotenv");
const cors = require("cors");
const {
  calculatePooleventOfTheDay
} = require("./service/dailyAchievementsService");
require("colors");

dotenv.config({ path: "./config/.env" });

const app = express();
var server = require("http").Server(app);
var io = require("socket.io")(server);

socket(io);
calculatePooleventOfTheDay();
eventEmitter();

if (process.env.NODE_ENV == "dev") {
  app.use(morgan);
}

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
connectMysql();
app.use(cors());

app.use("/waves/api/v1", routes);
app.use("/waves/api/v1/poolevent", poolevent);
app.use("/waves/api/v1/application", application);
app.use("/waves/api/v1/vote", vote);
app.use("/waves/api/v1/comment", comment);
app.use("/waves/api/v1/notification", notification);
app.use("/waves/api/v1/favorite", favorite);
app.use("/waves/api/v1/user", user);
app.use("/waves/api/v1/eventtype", eventtype);
app.use("/waves/api/v1/month", month);
app.use("/waves/api/v1/trophie", trophie);



const port = process.env.PORT || 5000;

server.listen(port, () => {
  console.log(
    `App running in ${process.env.NODE_ENV} mode on port ${port}`.green.bold
  );
});
