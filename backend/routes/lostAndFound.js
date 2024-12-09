const express = require('express');
const router = express.Router();
const { getLostItems, claimItem, uploadLostItem, deleteLostItem } = require('../controllers/lostAndFoundController');
const { isAuthenticated, isAdmin } = require('../middleware/authMiddleware');
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

// User: View lost items
router.get('/', getLostItems);

// User: Claim an item
router.post('/claim', isAuthenticated, claimItem);

// Admin: Upload new lost item
router.post('/', isAuthenticated, isAdmin, upload.single('image'), uploadLostItem);

// Admin: Delete a lost item
router.delete('/:itemId', isAuthenticated, isAdmin, deleteLostItem);

module.exports = router;
