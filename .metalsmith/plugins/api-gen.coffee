#
# # API Gen
#
# An experimental plugin for generating a JSON output API.
#
newPage = require './new-page'



newJsonPage = () ->


module.exports = (opts={}) ->
  (files, metalsmith, done) ->
    metadata = metalsmith.metadata()

    guides = []
    for guide in metadata.collections.guide
      guides.push
        path: guide.filename
        date: guide.date
        author:
          name: guide.author.name
          username: guide.author.username
        title: guide.title

    fn = newPage
      output: '/api/guides.json'
      metadata:
        contents: new Buffer JSON.stringify guides, undefined, 2
    fn files, metalsmith, done
