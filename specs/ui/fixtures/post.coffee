define ['underscore'], (_) ->
  PostFixtures =
    valid:
      [
        {
          id: 1
          title: 'A blog post'
          body: '<p>First paragraph</p><p>Second paragraph</p>'
          teaser: 'First paragraph'
          published: false
        }
      ]
