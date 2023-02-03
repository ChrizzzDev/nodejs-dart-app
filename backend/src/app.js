const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const app = express().set('port', 9222);

app.use(morgan('dev'));
app.use(cors());
app.use(require('./routes/users'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

module.exports = app;