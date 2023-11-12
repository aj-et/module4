// Require statments
const express = require('express');
require("dotenv").config();

const app = express();

// Local server info
const port = process.env.PORT
const host = process.env.host

app.use(express.json());

app.use('/', require('./routes/index'))
app.use('/recipe', require('./routes/recipes'));

app.listen(port, () => {
    console.log(`Server running on http://${host}:${port}/api-docs`)
})