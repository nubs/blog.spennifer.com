module.exports = (mongoose) ->
  postSchema = new mongoose.Schema
    title:
      type: String
      required: true
    published: Boolean

  Post = mongoose.model 'Post', postSchema
