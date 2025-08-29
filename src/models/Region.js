module.exports = (sequelize, DataTypes) => {
  const Region = sequelize.define('Region', {
    iso: {
      type: DataTypes.STRING(3),
      primaryKey: true,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false
    }
  }, {
    tableName: 'regions',
    timestamps: false
  });

  return Region;
};