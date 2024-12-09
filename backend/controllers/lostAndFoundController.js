const LostItem = require('../models/lostItem');

// Get all lost items
exports.getLostItems = async (req, res) => {
  try {
    const items = await LostItem.find();
    res.json(items);
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};

// Claim a lost item
exports.claimItem = async (req, res) => {
  const { itemId, userId } = req.body;

  try {
    const item = await LostItem.findById(itemId);
    if (!item) {
      return res.status(400).json({ message: 'Item not found' });
    }

    item.claimedBy = userId;
    await item.save();
    res.json({ message: 'Item claimed successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};

// Admin upload new lost item
exports.uploadLostItem = async (req, res) => {
  const { name, description, location } = req.body;
  const imageUrl = req.file.path;

  try {
    const newItem = new LostItem({ name, description, location, image: imageUrl });
    await newItem.save();
    res.status(201).json({ message: 'Item uploaded successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};

// Admin delete lost item
exports.deleteLostItem = async (req, res) => {
  const { itemId } = req.params;

  try {
    await LostItem.findByIdAndDelete(itemId);
    res.json({ message: 'Item deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};
