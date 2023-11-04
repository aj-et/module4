const express = require('express');
const router = express.Router();

router.use('/', require('./swagger'))
router.use('/recipe', require('./recipes'))

module.exports = router;