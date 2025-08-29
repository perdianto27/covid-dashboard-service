const { Sequelize } = require("sequelize");
const sequelize = require("../config/database");

const Region = require("./Region")(sequelize, Sequelize.DataTypes);
const CovidDailyStat = require("./CovidDailyStat")(sequelize, Sequelize.DataTypes);

module.exports = {
  sequelize,
  Region,
  CovidDailyStat
};