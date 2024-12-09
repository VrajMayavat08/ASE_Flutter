const FoodVendor = require('../models/foodVendor');

// Get all food vendors
exports.getFoodVendors = async (req, res) => {
  try {
    const vendors = await FoodVendor.find();
    res.json(vendors);
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};

// Admin add new food vendor
exports.addFoodVendor = async (req, res) => {
  const { name, menu, location, type } = req.body;
  const imageUrl = req.file.path;

  try {
    const newVendor = new FoodVendor({ name, menu, location, type, image: imageUrl });
    await newVendor.save();
    res.status(201).json({ message: 'Vendor added successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};

// Admin delete food vendor
exports.deleteFoodVendor = async (req, res) => {
  const { vendorId } = req.params;

  try {
    await FoodVendor.findByIdAndDelete(vendorId);
    res.json({ message: 'Vendor deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error' });
  }
};
