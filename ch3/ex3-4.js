const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({extended: true}));

app.get('/', (req, res) => {
  res.send(`<!DOCTYPE html>
    <html>
     <head> <meta charset="utf-8"><title>Login</title></head>
     <body>
      <h1>Login</h1>
      <form method="post" action="/login">
       <div>
        <label for="username-input">Username:</label>
        <input id="username-input" name="username" type="text">
       </div>
       <div>
        <label for="password-input">Password:</label>
        <input id="password-input" name="password" type="password">
       </div>
       <button type="submit">Submit</button>
      </form>
     </body>
    </html>      
    `)
});

app.post('/login', (req, res)=> {
  const {username, password} = req.body;
  res.type('text/plain').send(`username: ${username}\npassword: ${password}`);
});

app.listen(port, ()=>{
  console.log(`Server listening on http://localhost:${port}`);
});