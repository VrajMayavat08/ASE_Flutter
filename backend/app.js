const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const authRoutes = require('./routes/auth');
const lostAndFoundRoutes = require('./routes/lostAndFound');
const foodVendorsRoutes = require('./routes/foodVendors');
const { initializeAdmin } = require('./utils/initializeAdmin');

// Load environment variables
dotenv.config();

// Initialize app
const app = express();
app.use(express.json());
app.use(cors());

// Connect to MongoDB
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to MongoDB");
    initializeAdmin();  // Initialize default admin if not present
  })
  .catch(err => {
    console.error("MongoDB connection error:", err);
  });

// Set up routes
app.use('/api/auth', authRoutes);
app.use('/api/lost-found', lostAndFoundRoutes);
app.use('/api/food-vendors', foodVendorsRoutes);

// Serve static files (images)
app.use('/uploads', express.static('uploads'));

// Default route
app.get('/', (req, res) => res.send('Backend is running'));

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
