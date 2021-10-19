const express = require('express');
const app = express();
const cors = require('cors');
const routes = require('./routes/suma');
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(express.json());
app.use(cors());

// Routes
app.use('/api/v1/', routes);

app.listen(PORT, () => console.log('Servidor corriendo'));