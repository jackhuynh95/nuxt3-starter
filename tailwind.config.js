const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')
const primary = '#00DC82'
const secondary = colors.pink
const info = colors.sky
const warning = colors.amber
const success = colors.emerald
const error = colors.red

module.exports = {
  mode: 'jit',
  future: {
    removeDeprecatedGapUtilities: true,
  },
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary,
        secondary,
        info,
        warning,
        success,
        error,
      },
      textColor: {
        skin: {
          base: 'var(--color-text-base)',
          muted: 'var(--color-text-muted)',
          active: 'var(--color-text-active)',
          hover: 'var(--color-text-hover)',
          icon: 'var(--color-text-icon)',
        },
      },
      backgroundColor: {
        skin: {
          fill: 'var(--color-fill)',
          'fill-active': 'var(--color-fill-active)',
          'fill-hover': 'var(--color-fill-hover)',
          'icon-fill': 'var(--color-icon-fill)',
        },
      },
      fontFamily: {
        sans: ['Poppins', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        scrollY: {
          '0%': { opacity: '0', transform: 'translateY(0)' },
          '100%': { opacity: '1', transform: 'translateY(200%)' },
        },
      },
      animation: {
        scroll: 'scrollY 1s ease-in-out infinite',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('daisyui'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/typography'),
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          primary: '#00DC82',
          secondary: '#00DC82',
          accent: '#00DC82',
          neutral: '#162337',
          'base-100': '#FFFFFF',
          info: '#3ABFF8',
          success: '#36D399',
          warning: '#FBBD23',
          error: '#F87272',
        },
      },
    ],
  },
}
