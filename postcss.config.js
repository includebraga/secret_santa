module.exports = {
  plugins: {
    "postcss-import": {},
    "postcss-cssnext": {},
    "postcss-modules": {
      getJSON: () => {},
      generateScopedName: "[folder]__[local]__[hash]"
    },
    "precss": {},
  }
};
