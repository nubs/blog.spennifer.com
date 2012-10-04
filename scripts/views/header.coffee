define ['underscore', 'backbone'], (_, Backbone) ->
  () ->
    HeaderView = Backbone.View.extend
      events:
        'click #pageTitle': 'goHome'

      initialize: ->
        _.bindAll this, 'goHome'

      goHome: (e) ->
        e.preventDefault()
        @options.app.navigate '/', trigger: true
