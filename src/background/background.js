const axios = require("axios");
const { Region, CovidDailyStat } = require("../models");
require("dotenv").config();

async function saveRegions() {
  try {
    const response = await axios.get(
      `${process.env.COVID_API_BASE_URL}/api/regions?order=name&sort=asc`,
      {
        headers: {
          accept: "application/json",
          "X-CSRF-TOKEN": ""
        }
      }
    );
    // console.log("response", response.data);
    const regions = response.data.data;

    await Region.destroy({
      where: {}, // hapus semua data
      truncate: true
    });

    await Region.bulkCreate(
      regions.map(({ iso, name }) => ({
        iso,
        name
      })),
      {
        updateOnDuplicate: ["name"]
      }
    );

    console.log(`✅ ${regions.length} data negara berhasil disimpan:`, new Date().toISOString());
  } catch (err) {
    console.error("❌ Gagal fetch/simpan data:", err.message);
  }
}

async function saveCovidStats(today) {
  try {
    const mockDate = '2020-03-13'
    const regions = await Region.findAll({
      limit: 5,
      order: [['created_at', 'DESC']]
    });
    const promises = regions.map(region => {
    const url = `${process.env.COVID_API_BASE_URL}/api/reports/total?date=${mockDate}&iso=${region.iso}`;
      return axios.get(url, {
        headers: { accept: "application/json", "X-CSRF-TOKEN": "" }
      }).then(res => ({ iso: region.iso, data: res.data.data }));
    });
    const results = await Promise.all(promises);

    for (const result of results) {
      const data = result.data;
      // skip jika data tidak ada atau date tidak ada
      if (!data || !data.date) {
        console.log(`⚠️ Data untuk ISO ${result.iso} kosong, dilewati`);
        continue;
      }

      const {
        date,
        last_update,
        confirmed,
        confirmed_diff,
        deaths,
        deaths_diff,
        recovered,
        recovered_diff,
        active,
        active_diff,
        fatality_rate,
        region
      } = result.data;

      const cities = region?.cities ? JSON.stringify(region.cities) : null;

      await CovidDailyStat.create({
        iso: result.iso,
        date,
        last_update,
        confirmed,
        confirmed_diff,
        deaths,
        deaths_diff,
        recovered,
        recovered_diff,
        active,
        active_diff,
        fatality_rate,
        cities,
      });
    }

    console.log(`✅ Data berhasil disimpan untuk tanggal: ${today}`);
  } catch (err) {
    console.error("❌ Gagal fetch/simpan data:", err.message);
  }
}

module.exports = { saveRegions, saveCovidStats };