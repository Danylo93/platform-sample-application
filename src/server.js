const http = require('node:http');

const port = process.env.PORT || 8080;
const environment = process.env.APP_ENV || 'local';

const server = http.createServer((req, res) => {
  res.setHeader('Content-Type', 'application/json');

  if (req.url === '/health') {
    res.writeHead(200);
    return res.end(JSON.stringify({ status: 'UP', environment }));
  }

  res.writeHead(200);
  res.end(JSON.stringify({
    app: 'platform-sample-application',
    environment,
    message: 'Platform Engineering OpenShift Lab'
  }));
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Application listening on ${port}`);
});
