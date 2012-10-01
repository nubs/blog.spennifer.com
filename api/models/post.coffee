module.exports = (mongoose) ->
  postSchema = new mongoose.Schema
    title:
      type: String
      required: true
    body:
      type: String
      required: true
    teaser:
      type: String
      required: true
    published: Boolean

  Post = mongoose.model 'Post', postSchema
