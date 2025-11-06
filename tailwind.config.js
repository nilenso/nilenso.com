/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./templates/**/*.tera",
    "./content/**/*.{md,html}",
    "./static/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
