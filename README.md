# waves-rest-api

  

[![Build Status](https://travis-ci.org/rwieruch/node-express-server-rest-api.svg?branch=master)](https://travis-ci.org/rwieruch/node-express-server-rest-api) [![Slack](https://slack-the-road-to-learn-react.wieruch.com/badge.svg)](https://slack-the-road-to-learn-react.wieruch.com/) [![Greenkeeper badge](https://badges.greenkeeper.io/rwieruch/node-express-server-rest-api.svg)](https://greenkeeper.io/)

  



## Features

  

* Babel 7

* Environment Variables

* Express

* REST API

* Mongoose

* Socket io

  

## Requirements

  

*  [node & npm](https://nodejs.org/en/)

*  [git](https://www.robinwieruch.de/git-essential-commands/)

*  [XAMPP](https://www.apachefriends.org/de/download.html) 

*  [.env](bilal.bellafkir@gmail.com)

## Installation

  

*  `git clone git@github.com:rwieruch/node-express-server-rest-api.git`

*  `cd wave-backend`

*  `npm install`

*  `npm start`

*  `npm run dev`


  

### GET Routes

  

* visit http://localhost:5000

* /poolevent

* /poolevent/:id

  

### Beyond GET Routes

  

#### CURL

  

* Create a poolevent with:

*  `curl -X POST -H "Content-Type:application/json" http://localhost:5000/poolevent -d '{"text":"Hi again, World"}'`

* Delete a message with:

*  `curl -X DELETE -H "Content-Type:application/json" http://localhost:5000/poolevent/1`

  

#### Postman

  

* Install [Postman](https://www.getpostman.com/apps) to interact with REST API

* Create a message with:

* URL: http://localhost:5000/poolevent

* Method: POST

* Body: raw + JSON (application/json)

* Body Content: `{ "text": "Hi again, World" }`

* Delete a message with:

* URL: http://localhost:5000/poolevent/1

* Method: DELETE
