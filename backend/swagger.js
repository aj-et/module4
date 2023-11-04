const swaggerAutogen = require('swagger-autogen')();

const doc = {
    info: {
        title: 'Recipe API',
        description: 'This contains food recipe data',
    },
    host: 'localhost:8080',
    schemes: ['http'],
};

const outputFile = './swagger.json';
const endpointsFiles = ['./routes/index.js'];

// generate swagger.json
swaggerAutogen(outputFile, endpointsFiles, doc)