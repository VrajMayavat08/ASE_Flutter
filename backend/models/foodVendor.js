const mongoose = require('mongoose');

const foodVendorSchema = new mongoose.Schema({
  name: { type: String, required: true },
  menu: { type: [String], required: true },
  location: { type: String, required: true },
  type: { type: String, required: true },  // E.g., Restaurant, Cafe
  image: { type: String, required: true },
});

module.exports = mongoose.model('FoodVendor', foodVendorSchema);
