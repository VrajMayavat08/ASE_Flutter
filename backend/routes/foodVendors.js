const express = require('express');
const router = express.Router();
const { getFoodVendors, addFoodVendor, deleteFoodVendor } = require('../controllers/foodVendorController');
const { isAuthenticated, isAdmin } = require('../middleware/authMiddleware');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

// Get all food vendors
router.get('/', getFoodVendors);

// Admin: Add a food vendor
router.post('/', isAuthenticated, isAdmin, upload.single('image'), addFoodVendor);

// Admin: Delete a food vendor
router.delete('/:vendorId', isAuthenticated, isAdmin, deleteFoodVendor);

module.exports = router;
