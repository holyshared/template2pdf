describe 'PDFExpoter', ->
  describe 'render()', ->
    before ->
      @renderer = new JadeRenderer
      @exporter = new PDFExpoter @renderer
    it 'returns render content', ->
      @timeout 3000
      template = path.resolve(__dirname, 'fixtures/content.jade')

      @exporter.render(template, { title: 'jade' }).then (result) ->
        stream = result.toStream()
        assert.ok(stream instanceof Readable)