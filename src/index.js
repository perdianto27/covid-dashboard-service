const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const cron = require('node-cron');

const Logger = require('./helpers/logger');
const dashboard = require('./routes/DashboardRoutes');
const background = require('./background/background');

dotenv.config();

const app = express();
const port = process.env.PORT || 9000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(Logger.httpLogger);

// Routes
app.use('/dashboard', dashboard);

const cronSchedule = process.env.CRON_SCHEDULE || "0 0 * * *";
cron.schedule(cronSchedule, () => {
  const today = new Date();
  const date = today.toISOString().split('T')[0];

  Logger.log(['Info'], `Cron jalan: ${new Date().toISOString()}`);

  background.saveRegions();
  background.saveCovidStats(date);
});

app.listen(port, () => {
  Logger.log(['Info'], `Server started on port ${port}`);
});