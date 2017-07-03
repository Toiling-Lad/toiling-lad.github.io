const serve = require('serve')

const server = serve(__dirname, {
  port: 4000,
  ignore: ['node_modules']
})