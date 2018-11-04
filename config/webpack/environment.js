const { environment } = require('@rails/webpacker');
const path = require('path');

environment.config.merge({
  resolve: {
    alias: {
      root: path.resolve('./frontend'),
    },
  },
});

module.exports = environment;
