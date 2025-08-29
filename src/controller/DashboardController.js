const { StatusCodes } = require('http-status-codes');

const { sequelize, Region, CovidDailyStat } = require("../models");

const Logger = require('../helpers/logger');

const logName = 'API Dashboard';

const getListRegion = async (request, res) => {
  try {

    const regions = await Region.findAll();

    return res
    .status(StatusCodes.OK)
    .send({
      responseCode: StatusCodes.OK,
      responseDesc: "Berhasil mengambil data",
      data: regions
  });
  } catch (err) {
    Logger.log([logName, 'GET Region', 'ERROR'], {
      message: `${err}`,
    });
    return res
      .status(StatusCodes.INTERNAL_SERVER_ERROR)
      .send({
        responseCode: StatusCodes.INTERNAL_SERVER_ERROR,
        responseDesc: "Gagal mengambil data"
    });
  }
};

const getTotalStats = async (request, res) => {
  try {
    const { iso, date } = request.query;

    if (!iso || !date) {
      return res.status(StatusCodes.BAD_REQUEST).json({
        responseCode: StatusCodes.BAD_REQUEST,
        responseDesc: "Parameter 'iso' dan 'date' wajib diisi",
      });
    }

    const total_positif = (await CovidDailyStat.sum('confirmed', { where: { iso, date } })) ?? 0;
    const total_sembuh = (await CovidDailyStat.sum('recovered', { where: { iso, date } })) ?? 0;
    const total_kematian = (await CovidDailyStat.sum('deaths', { where: { iso, date } })) ?? 0;

    return res.status(StatusCodes.OK).json({
      responseCode: StatusCodes.OK,
      responseDesc: "Berhasil mengambil data",
      data: {
        total_positif,
        total_sembuh,
        total_kematian,
      },
    });
  } catch (err) {
    console.error("❌ getTotalStats error:", err.message);
    return res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({
      responseCode: StatusCodes.INTERNAL_SERVER_ERROR,
      responseDesc: "Terjadi kesalahan server",
      error: err.message,
    });
  }
};

const getTimelineStats = async (request, res) => {
  try {
    const iso = request.query.iso
    const dateParam = request.query.date;
    if (!iso) {
      return res.status(StatusCodes.BAD_REQUEST).json({
        responseCode: StatusCodes.BAD_REQUEST,
        responseDesc: "Parameter 'iso' wajib diisi",
      });
    }

    const sql = `
      SELECT 
          date,
          confirmed AS positif,
          recovered AS sembuh,
          deaths AS meninggal
        FROM covid_daily_stats
        WHERE iso = ?
          AND date BETWEEN DATE(?) - INTERVAL 30 DAY AND DATE(?) - INTERVAL 1 DAY
        ORDER BY date ASC
      `;
    const results = await sequelize.query(sql, {
      replacements: [iso, dateParam, dateParam],
      type: sequelize.QueryTypes.SELECT,
    });

    return res.status(StatusCodes.OK).json({
      responseCode: StatusCodes.OK,
      responseDesc: "Berhasil mengambil data",
      data: {
        iso,
        timeline: results
      }
    });
  } catch (err) {
    console.error("❌ getTimelineStats error:", err.message);
    return res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({
      responseCode: StatusCodes.INTERNAL_SERVER_ERROR,
      responseDesc: "Terjadi kesalahan server",
      error: err.message,
    });
  }
};

const getPotensiPositif = async (request, res) => {
  try {
    const iso = request.query.iso
    const dateParam = request.query.date;
    const sql = `
      SELECT 
        SUM(confirmed) AS total_positif,
        SUM(recovered) AS total_sembuh,
        SUM(deaths) AS total_meninggal
      FROM covid_daily_stats
      WHERE iso = ?
        AND date = ?
    `;
    const result = await sequelize.query(sql, {
      replacements: [iso, dateParam],
      type: sequelize.QueryTypes.SELECT,
    });

    const { total_positif, total_sembuh, total_meninggal } = result[0];
    let persentase = 0;
    if (total_positif > 0) {
      persentase = ((total_positif - (total_sembuh + total_meninggal)) / total_positif) * 100;
    }

    return res.status(StatusCodes.OK).json({
      responseCode: StatusCodes.OK,
      responseDesc: "Berhasil mengambil data",
      data: {
        potensi_positif: persentase.toFixed(2)
      }
    });
  } catch (err) {
    console.error("❌ getTimelineStats error:", err.message);
    return res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({
      responseCode: StatusCodes.INTERNAL_SERVER_ERROR,
      responseDesc: "Terjadi kesalahan server",
      error: err.message,
    });
  }
};


module.exports = {
  getListRegion,
  getTotalStats,
  getTimelineStats,
  getPotensiPositif
};