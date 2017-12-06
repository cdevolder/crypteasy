const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const fileLoader = environment.loaders.get('file');

fileLoader.test = /\.(jpg|jpeg|png|gif|eot|otf|ttf|woff|woff2|svg)$/i;

environment.plugins.set('Provide',  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable',
  })
)

const config = environment.toWebpackConfig()

config.resolve.alias = {
  jquery: "jquery/src/jquery",
}

module.exports = environment
