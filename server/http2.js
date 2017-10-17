const fs = require('fs');
const options = {
    key: fs.readFileSync('./server.key'),
    cert: fs.readFileSync('./server.crt')
};

require('http2').createServer(options, function(request, response) {
    response.end('Hello world!');
}).listen(3000);
