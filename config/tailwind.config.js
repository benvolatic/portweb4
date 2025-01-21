module.exports = {
  content: [
    './app/views/**/*.{erb,html,html.erb}',
    './app/helpers/**/*.rb',       
    './app/javascript/**/*.js',    
    './app/assets/stylesheets/**/*.css',
  ],
  theme: {
    extend: {
      fontFamily: {
          title: ["Cutive Mono", "serif"]
      },
      colors: {
        'primary': '#1E3A8A',    // Your dark blue
        'secondary': '#FF4D00',  // Your orange
        'accent': '#D3D3D3',
      },
    },  // Remove all custom configurations temporarily
  },
  safelist: [
    'text-primary',
    'bg-primary',
    'text-secondary',
    'bg-secondary',
  ],
  plugins: [],
};
