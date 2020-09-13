// const { notify } = require("../routes");

exports.getNotifications = async (req, res) => {
  //------------------------------------------------------
  //About what data do you want to send Notifications out?
  //In this case:
  // --> events
  // --> applications
  // --> comments
  //-------------------------------------------------------
  var eventIDs = [];
  var Notifications = [];

  //-----------------------------------
  //GetEvents
  //filter:
  // --> state == RELEASED, AND p.state="RELEASED"
  // --> event.start >= current.time
  //-----------------------------------
  var sql = `SELECT 
  p.id, 
  p.name,
  p.user_id,
  p.created_at,
  p.event_start,
  p.event_end,
  p.application_end, 
  p.supporter_lim,
  l.longitude,
  l.latitude,
  l.locality,
  COUNT(a.id) AS applications
  FROM poolevents p 
  JOIN locations l ON l.poolevent_id=p.id 
  LEFT JOIN applications a ON p.id=a.poolevent_id
  WHERE p.event_start >= CURRENT_TIMESTAMP
  GROUP BY p.id, l.id;`;

  const events = await new Promise((resolve, reject) => {
    console.log("er");
    console.log(sql);
    global.conn.query(sql, (error, poolevents) => {
      console.log(error);
      console.log(poolevents);

      return error ? reject(error) : resolve(poolevents);
    });
  });

  console.log(events);

  //--------------------------
  //Format into Notifications
  //--------------------------
  events.forEach((poolEvent) => {
    var notify = new Object();

    notify.Microservice = "WAVES";
    notify.type = "event";
    notify.date = Date.now();
    notify.typeId = poolEvent.id;
    notify.validTill = poolEvent.event_end;
    notify.layoutParameters = {
      eventId: poolEvent.id,
      eventName: poolEvent.name,
      eventCity: poolEvent.locality,
      eventDate: poolEvent.event_start,
      applicationEnd: poolEvent.application_end,
    };
    notify.matchingParameters = {
      eventId: poolEvent.id,
      eventDate: poolEvent.event_start,
      applicationEnd: poolEvent.application_end,
      latitude: poolEvent.latitude,
      longitude: poolEvent.longitude,
      applications: poolEvent.applications,
      userId: poolEvent.user_id,
    };
    Notifications.push(notify);

    //Make List of Notification ID'S for applications
    eventIDs.push(poolEvent.id);
  });

  //-----------------------------------
  //GetApplications
  //filter:
  // --> event.state == RELEASED
  // --> event.start >= current.time
  //-----------------------------------
  if (events.lenght > 0) {
    sql = `SELECT a.created_at,
    a.id as application_id,
    u.id as user_id,
    u.first_name,
    u.last_name,
    a.text,
    a.state,
    a.poolevent_id,
    p.event_end,
    p.name
    FROM applications a
    JOIN users u ON u.id=a.user_id 
    JOIN poolevents p ON p.id=a.poolevent_id
    WHERE a.poolevent_id IN (${eventIDs});`;

    const applications = await new Promise((resolve, reject) => {
      global.conn.query(sql, (error, applications) => {
        return error ? reject(error) : resolve(applications);
      });
    });

    console.log(applications);

    //--------------------------
    //Format into Notifications
    //--------------------------
    applications.forEach((application) => {
      var notify = new Object();

      notify.Microservice = "WAVES";
      notify.type = "application";
      notify.date = Date.now();
      notify.typeId = application.application_id;
      notify.validTill = application.event_end;
      notify.layoutParameters = {
        applicationId: application.application_id,
        userId: application.user_id,
        applicationState: application.state,
        poolEventName: application.name,
      };
      notify.matchingParameters = {
        userId: application.user_id,
        eventId: application.poolevent_id,
      };
      Notifications.push(notify);
    });

    //-----------------------------------
    //GetComments
    //filter:
    // --> event.state == RELEASED
    // --> event.start >= current.time
    //-----------------------------------
    sql = `SELECT c.text, 
    c.id, 
    c.created_at,       
    c.user_id,
    u.full_name, 
    u.first_name,
    u.last_name,
    p.event_end,
    c.poolevent_id,
    p.name
    FROM comments c 
    JOIN users u ON c.user_id=u.id 
    JOIN poolevents p ON p.id=c.poolevent_id 
    WHERE c.poolevent_id IN ('${eventIDs}');`;

    const comments = await new Promise((resolve, reject) => {
      global.conn.query(sql, (error, comments) => {
        return error ? reject(error) : resolve(comments);
      });
    });

    console.log(comments);

    //--------------------------
    //Format into Notifications
    //--------------------------
    comments.forEach((comment) => {
      var notify = new Object();

      notify.Microservice = "WAVES";
      notify.type = "comment";
      notify.date = Date.now();
      notify.typeId = comment.id;
      notify.validTill = comment.event_end;
      notify.layoutParameters = {
        commentId: comment.id,
        userId: comment.user_id,
        userName: comment.full_name,
        Text: comment.text,
        poolEventName: comment.name,
      };
      notify.matchingParameters = {
        userId: comment.user_id,
        eventId: comment.poolevent_id,
      };
      Notifications.push(notify);
    });
  }
  res.status(200).json({
    success: true,
    data: Notifications,
  });
};
