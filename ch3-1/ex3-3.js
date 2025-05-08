const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res)=>{
  const {number} = req.query;
  if (number == undefined){
    return res.status(400).send('Missing number query parameters');
  }
  res.redirect(302, `/factorial/${encodeURIComponent(number)}`);
});

app.get('/factorial/:number', (req, res)=> {
  const n = Number(req.params.number);
  if (!Number.isInteger(n) || n<0){
    return res.status(400).send(`Invalid number`);
  }
  let fact = 1;
  for (let i=1; i<=n;i++){
    fact*= i;
  }

  res.send(fact.toString());
});

app.listen(port, () => {
  console.log(`Server listening on http://localhost:${port}`);
});