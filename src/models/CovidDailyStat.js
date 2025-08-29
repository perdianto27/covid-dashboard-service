// models/CovidDailyStat.js
module.exports = (sequelize, DataTypes) => {
  const CovidDailyStat = sequelize.define(
    "CovidDailyStat",
    {
      id: {
        type: DataTypes.BIGINT,
        autoIncrement: true,
        primaryKey: true,
      },
      date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
      },
      iso: {
        type: DataTypes.STRING(3),
        allowNull: false
      },
      last_update: {
        type: DataTypes.DATE,
        allowNull: true,
      },
      confirmed: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      confirmed_diff: DataTypes.INTEGER,
      deaths: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      deaths_diff: DataTypes.INTEGER,
      recovered: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      recovered_diff: DataTypes.INTEGER,
      active: DataTypes.INTEGER,
      active_diff: DataTypes.INTEGER,
      fatality_rate: DataTypes.DECIMAL(10, 4),
      cities: {
        type: DataTypes.TEXT, // simpan JSON string
        allowNull: true,
      },
    },
    {
      tableName: "covid_daily_stats",
      timestamps: false,
    }
  );

  return CovidDailyStat;
};