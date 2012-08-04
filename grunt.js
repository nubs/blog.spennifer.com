module.exports = function(grunt) {
  grunt.initConfig({
    pkg: '<json:package.json>',
    clean: ['build'],
    coffee: {
      scripts: {
        options: {
          bare: false
        },
        files: {
          'build/scripts/models/post.js': 'scripts/models/post.coffee',
          'build/scripts/collections/posts.js': 'scripts/collections/posts.coffee',
          'build/scripts/routers/router.js': 'scripts/routers/router.coffee',
          'build/scripts/views/posts.js': 'scripts/views/posts.coffee'
        }
      },
      specs: {
        options: {
          bare: false
        },
        files: {
          'build/specs/helpers/helpers.js': 'specs/helpers/helpers.coffee',
          'build/specs/fixtures/post.js': 'specs/fixtures/post.coffee',
          'build/specs/models/post.spec.js': 'specs/models/post.spec.coffee',
          'build/specs/collections/posts.spec.js': 'specs/collections/posts.spec.coffee',
          'build/specs/routers/routes.spec.js': 'specs/routers/routes.spec.coffee',
          'build/specs/routers/routers.spec.js': 'specs/routers/routers.spec.coffee'
        }
      }
    },
    copy: {
      specrunner: {
        files: {
          'build/specs': 'specs/*'
        }
      },
      jasmine: {
        files: {
          'build/vendor/jasmine': 'vendor/jasmine/lib/jasmine-core/*'
        }
      },
      jasmineSinon: {
        files: {
          'build/vendor/jasmine-sinon': 'vendor/jasmine-sinon/lib/jasmine-sinon.js'
        }
      },
      requirejs: {
        files: {
          'build/vendor/requirejs': 'vendor/requirejs/require.js'
        }
      },
      requirejsText: {
        files: {
          'build/vendor/requirejs-text': 'vendor/requirejs-text/text.js'
        }
      },
      sinonjs: {
        files: {
          'build/vendor/sinonjs': 'vendor/sinonjs/sinon.js'
        }
      }
    },
    watch: {
      files: '<config:coffee.files>',
      tasks: 'default'
    },
    jasmine: {
      index: ['build/specs/index.html']
    }
  });

  grunt.loadTasks('tasks');
  grunt.loadNpmTasks('grunt-jasmine-task');
  grunt.loadNpmTasks('grunt-contrib');

  grunt.registerTask('default', 'copy coffee');
  grunt.registerTask('travis', 'copy coffee jasmine');
};
