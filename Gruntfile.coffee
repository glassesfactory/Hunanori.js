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
      example:
        options:
          bare: true
        expand: true
        cwd: 'example'
        src: ['*.coffee']
        dest: 'example'
        ext: '.js'

      test:
        expand: true
        options:
          bare: true
        cwd: 'test/spec/'
        src: '*.coffee'
        dest: 'test/spec/'
        ext: '.js'


    connect:
      jasmine:
        options:
          port: 8900

      test:
        options:
          keepalive: true
          prot: 8901
          base: "test/"

    jasmine:
      product:
        src: "test/src/*.js"
        options:
          host: "http://127.0.0.1:8900/"
          specs: "test/spec/*Spec.js"
          helpers: "test/spec/*Helper.js"

    uglify:
      product:
        files:
          'dist/Hunanori.min.js': ['dist/Hunanori.js']

    watch:
      coffee:
        files: ["src/coffee/*.coffee", "example/*.coffee"]
        tasks: ["coffee:product", "coffee:example"]

      test:
        files: ["test/spec/*.coffee"]
        tasks: ["coffee:test", "test"]


  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-connect"

  grunt.registerTask "default", ["coffee"]
  grunt.registerTask "test", ["connect:jasmine", "jasmine:product"]
  grunt.registerTask "build", ["coffee", "uglify:product"]
