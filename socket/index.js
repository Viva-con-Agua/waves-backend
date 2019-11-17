const socket = io => {
  io.on("connection", function(socket) {
    //TODO: save to database
    console.log("event listner: ", global.em.listenerCount("NEW_POOLEVENT"));

    global.em.on("NEW_POOLEVENT", () => {
      socket.emit("NEW_POOLEVENT");
      console.log("event listner: ", global.em.listenerCount("NEW_POOLEVENT"));
    });

    global.em.on("NEW_BADGE", data => {
      socket.emit("NEW_BADGE", data);
    });

    console.log(`user ${socket.id} connected`);
    socket.on("disconnect", () => {
      //TODO: delete from database
      global.em.removeListener("NEW_POOLEVENT", () => {
        console.log("listner removed");
      });
      console.log(`user ${socket.id} disconnected`);
    });
  });
};

module.exports = socket;
