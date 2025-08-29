const express = require('express');
const Router = express.Router();

const dashboard = require('../controller/DashboardController');

Router.get('/list-region', dashboard.getListRegion);
// Total & Akumulasi
Router.get('/total', dashboard.getTotalStats);
// Timeline H-30 s.d H-1
Router.get('/timeline', dashboard.getTimelineStats);
// Persentase Potensi Kasus Positif
Router.get('/potensi', dashboard.getPotensiPositif);


module.exports = Router;