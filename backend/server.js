// Require statments
const express = require('express');
const pool = require('./db')
const cors = require('cors');
require("dotenv").config();
const { getRecipeData, getIngredientByRecipeId, getInstructionByRecipeId } = require('./controllers/recipe')

const app = express();

// Local server info
const port = process.env.PORT
const host = process.env.host

app.use(express.json());

app.use('/', require('./routes/index'))
app.use('/recipe', require('./routes/recipes'));

app.listen(port, () => {
    console.log(`Server running on http://${host}:${port}`)
})