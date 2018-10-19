module.exports = {
  plugins: {
    "precss": {},
    "postcss-import": {},
    "postcss-cssnext": {},
    "postcss-modules": {
      getJSON: () => {},
      generateScopedName: "[folder]__[local]__[hash]"
    },
  }
};
