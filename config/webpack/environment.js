const { environment } = require('@rails/webpacker');
const Dotenv = require('dotenv-webpack');

// Adding the dotenv-webpack plugin to the environment plugins
environment.plugins.prepend('Dotenv', new Dotenv({
  path: './.env', // specify the path to your .env file if it's not in the root directory
  safe: false,    // load '.env.example' to check all necessary variables are defined, set to false if not using
  systemvars: true // load all the predefined 'process.env' variables which will trump anything local per dotenv specs.
}));

module.exports = environment;
