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
          'build/scripts/views/posts.js': 'scripts/views/posts.coffee',
          'build/scripts/views/post.js': 'scripts/views/post.coffee',
          'build/scripts/main.js': 'scripts/main.coffee',
          'build/index.js': 'index.coffee'
        }
      },
      api: {
        options: {
          bare: false
        },
        files: {
          'build/api/models/post.js': 'api/models/post.coffee',
          'build/api/post.js': 'api/post.coffee',
          'build/api/index.js': 'api/index.coffee'
        }
      },
      uispecs: {
        options: {
          bare: false
        },
        files: {
          'build/specs/ui/helpers/helpers.js': 'specs/ui/helpers/helpers.coffee',
          'build/specs/ui/fixtures/post.js': 'specs/ui/fixtures/post.coffee',
          'build/specs/ui/models/post.spec.js': 'specs/ui/models/post.spec.coffee',
          'build/specs/ui/collections/posts.spec.js': 'specs/ui/collections/posts.spec.coffee',
          'build/specs/ui/routers/routes.spec.js': 'specs/ui/routers/routes.spec.coffee',
          'build/specs/ui/routers/routers.spec.js': 'specs/ui/routers/routers.spec.coffee',
          'build/specs/ui/views/posts.spec.js': 'specs/ui/views/posts.spec.coffee',
          'build/specs/ui/views/post.spec.js': 'specs/ui/views/post.spec.coffee'
        }
      },
      apispecs: {
        options: {
          bare: false
        },
        files: {
          'build/specs/api/models/post.spec.js': 'specs/api/models/post.spec.coffee'
        }
      }
    },
    copy: {
      specrunner: {
        files: {
          'build/specs/ui/': 'specs/ui/*'
        }
      },
      public: {
        files: {
          'build/public/': 'public/*'
        }
      },
      templates: {
        files: {
          'build/scripts/templates/': 'scripts/templates/*'
        }
      },
      jasmine: {
        files: {
          'build/vendor/jasmine/': 'vendor/jasmine/lib/jasmine-core/*'
        }
      },
      jasmineSinon: {
        files: {
          'build/vendor/jasmine-sinon/': 'vendor/jasmine-sinon/lib/jasmine-sinon.js'
        }
      },
      jasmineJquery: {
        files: {
          'build/vendor/jasmine-jquery/': 'vendor/jasmine-jquery/lib/jasmine-jquery.js'
        }
      },
      requirejs: {
        files: {
          'build/vendor/requirejs/': 'vendor/requirejs/require.js'
        }
      },
      requirejsText: {
        files: {
          'build/vendor/requirejs-text/': 'vendor/requirejs-text/text.js'
        }
      },
      sinonjs: {
        files: {
          'build/vendor/sinonjs/': 'node_modules/sinon/lib/sinon.js'
        }
      }
    },
    watch: {
      files: '<config:coffee.files>',
      tasks: 'default'
    },
    jasmine: {
      index: ['build/specs/ui/index.html']
    },
    jasmine_node: {
      specs: 'build/specs/api'
    }
  });

  grunt.loadNpmTasks('grunt-jasmine-task');
  grunt.loadNpmTasks('grunt-jasmine-node-task');
  grunt.loadNpmTasks('grunt-contrib');

  grunt.registerTask('default', 'copy coffee jasmine_node');
  grunt.registerTask('travis', 'copy coffee jasmine jasmine_node');
};
