const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const routes = require("./routes/controller.route")
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

require('./config/database.config');
require('./model/M_Product');


app.use('/dataProduct',routes);
module.exports = app;