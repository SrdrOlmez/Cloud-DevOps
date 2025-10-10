const http = require('http');
const PORT = 80;

const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello from Kubernetes!');
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

