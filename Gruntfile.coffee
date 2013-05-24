module.exports = (grunt) ->

  "use strict"

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      product:
        options:
          bare: true
        expand: true
        cwd: 'src/coffee'
        src: ['*.coffee']
        dest: 'dist'
        ext: '.js'

    uglify:
      product:
        files:
          'dist/Hunanori.min.js': ['dist/Hunanori.js']

    watch:
      coffee:
        files: ["src/coffee/*.coffee"]
        tasks: ["coffee:product"]

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["coffee"]
  grunt.registerTask "build", ["coffee", "uglify:product"]
