module.exports = {
  entry: './web/static/js/index.js',
  output: {
    path: './priv/static/js',
    filename: 'app.js'
  },
  module: {
    loaders: [
      {
        test: /\.jsx?/,
        exclude: /(node_modules|bower_components)/,
        loaders: [
          'babel'
        ],
        include: './web/static/js/index.js',
        query: {
          presets: [
            'es2015',
            'react'
          ]
        }
      }
    ]
  }
}