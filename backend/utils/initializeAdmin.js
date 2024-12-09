const User = require('../models/user');

const initializeAdmin = async () => {
  const adminExists = await User.findOne({ email: 'admin@admin.com' });

  if (!adminExists) {
    const adminUser = new User({
      email: 'admin@admin.com',
      name: 'Admin User',
      password: 'admin123',  // You should hash this password before storing
      role: 'admin'
    });

    await adminUser.save();
    console.log("Default admin created");
  }
};

module.exports = { initializeAdmin };
