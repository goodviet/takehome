const mongoose = require('mongoose')
const dotenv = require('dotenv')
dotenv.config()

mongoose.set("strictQuery", false);
mongoose.connect(process.env.MONGODB_URL)
    .then(() => console.log('Connect Database Successful!'))
    .catch(() => console.log('Error - Not connect with Database!'))