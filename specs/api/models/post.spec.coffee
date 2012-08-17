describe 'Post model', ->
  beforeEach ->
    sinon = require 'sinon'
    @mongooseStub =
      Schema: -> 'schema response'
      model: -> 'model response'

    @schemaSpy = sinon.spy @mongooseStub, 'Schema'
    @modelSpy = sinon.spy @mongooseStub, 'model'
    @Post = require('../../../api/models/post') @mongooseStub

  it 'should use a schema', ->
    expect(@schemaSpy.calledOnce).toBeTruthy()

  it 'should create a model', ->
    expect(@modelSpy.calledOnce).toBeTruthy()
    expect(@modelSpy.calledWith 'Post', new @mongooseStub.Schema).toBeTruthy()

  it 'should return the model', ->
    expect(@Post).toBe 'model response'
