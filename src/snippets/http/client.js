const http = require('http');

const postData = JSON.stringify({
  'msg': 'Hello World!'
});

const options = {
  hostname: 'ipinfo.io',
  port: 80,
  path: '/json',
  method: 'GET',
  headers: {
    'User-Agent': 'curl/7.84.0',
    // 'Content-Type': 'application/json',
    // 'Content-Length': Buffer.byteLength(postData)
  }
};

const req = http.request(options, (res) => {
  console.log(`STATUS: ${res.statusCode}`);
  console.log(`HEADERS: ${JSON.stringify(res.headers)}`);
  res.setEncoding('utf8');
  res.on('data', (chunk) => {
    console.log(`BODY: ${chunk}`);
    var ipinfo = JSON.parse(chunk);
    console.log(ipinfo)
  });
  res.on('end', () => {
    console.log('No more data in response.');
  });
});

req.on('error', (e) => {
  console.error(`problem with request: ${e.message}`);
});

// Write data to request body
// req.write(postData);
req.end();