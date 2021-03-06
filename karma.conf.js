module.exports = function(config) {
  config.set({
    //browsers: ['Chrome','Firefox'],
    browsers: ['Chrome'],
    //frameworks: ['jasmine'],
    frameworks: ['mocha', 'chai'],
    files: [
      'src/**/*.js',
      //'test/**/*.spec.js'
      //'test/jasmine/**/*.spec.js'
      'test/mocha/**/*.spec.js'
    ],
    reporters: ['progress', 'junit'],
    // the default configuration
    junitReporter: {
      //outputDir: 'results', // results will be saved as $outputDir/$browserName.xml
      outputDir: process.env['CIRCLE_TEST_REPORTS'] + '/karma', // results will be saved as $outputDir/$browserName.xml
      outputFile: undefined, // if included, results will be saved as $outputDir/$browserName/$outputFile
      suite: '' // suite will become the package name attribute in xml testsuite element
    }
  });
};