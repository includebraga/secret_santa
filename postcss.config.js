module.exports = {
  plugins: {
    precss: {},
    'postcss-import': {},
    'postcss-cssnext': {},
    'postcss-calc': { mediaQueries: true },
    'postcss-modules': {
      getJSON: () => {},
      generateScopedName: '[folder]__[local]__[hash]',
    },
  },
};
