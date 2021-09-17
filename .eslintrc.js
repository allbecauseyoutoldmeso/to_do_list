module.exports = {
  env: {
    browser: true,
    node: true
  },
  parser: 'babel-eslint',
  ignorePatterns: ['public/*', 'config/*'],
  rules: {
    semi: ['off'],
    quotes: ['error', 'single']
  }
}
