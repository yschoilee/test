const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.all('/', (req, res) => {

  const data = req.method === 'GET' ? req.query : (req.body || {});


  const output = Object.keys(data)
    .map(key => `${key}: ${data[key]}`)
    .join('\n');

  res.send(output);
});


app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});