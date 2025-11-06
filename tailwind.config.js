/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './templates/**/*.html',
    './content/**/*.md',
  ],
  theme: {
    extend: {
      colors: {
        'nilenso-pink': '#FF3D84',
        'pink': {
          300: '#FF3D84',
          500: '#FF3D84',
          600: '#E6377A',
        },
      },
      maxWidth: {
        '[1366px]': '1366px',
      },
      fontSize: {
        '[2.8rem]': '2.8rem',
        '[3.5rem]': '3.5rem',
      },
    },
  },
  plugins: [],
}
