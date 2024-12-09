const mongoose = require('mongoose');

const lostItemSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String, required: false },
  location: { type: String, required: true },
  image: { type: String, required: true },
  claimedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User', default: null },
});

module.exports = mongoose.model('LostItem', lostItemSchema);
