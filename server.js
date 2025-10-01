const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Set EJS as the template engine
app.set('view engine', 'ejs');

// Set views folder explicitly (not required but good practice)
app.set('views', path.join(__dirname, 'views'));

// Serve static files from public folder
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.get('/', (req, res) => {
    res.render('index'); // renders views/index.ejs
});

// Example extra routes (optional for now)
app.get('/inventory', (req, res) => {
    res.send('<h1>Inventory Page Coming Soon</h1>');
});

app.get('/services', (req, res) => {
    res.send('<h1>Services Page Coming Soon</h1>');
});

app.get('/contact', (req, res) => {
    res.send('<h1>Contact Page Coming Soon</h1>');
});

// Start server
app.listen(port, () => {
    console.log(`🚗 CSE Motors running at http://localhost:${port}`);
});
