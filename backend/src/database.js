const mongoose = require('mongoose');
const { resolve } = require('node:path');
require('dotenv').config({
  path: resolve(process.cwd(), '.env')
});

async function connect() {
  mongoose.set('strictQuery', true)
  await mongoose.connect(process.env.DATABASE_URI);
  console.log('Database: conencted');
}

module.exports = connect;