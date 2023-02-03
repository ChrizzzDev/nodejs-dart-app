const app = require('./app');
const connect = require('./database');

function main() {
  // Database
  void connect();

  // Express
  app.listen(app.get('port'));
  console.log('Listening on port: ' + app.get('port'));
}

void main();