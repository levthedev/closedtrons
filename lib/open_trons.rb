class OpenTrons
  def initialize(app)
    @app = app
  end

  def call(env)
    upstream_request = HTTParty.get('http://opentrons.com')

    body = upstream_request.body
      .sub('<head>', %(<head><base href="http://opentrons.com">))
      .sub('img/logo_white_no-glow.png', 'http://www.redactedgame.com/wp-content/uploads/2011/12/logo.png')
      .sub("It uses manual micropipettes", "It uses satanic magic")
      .sub('Open Source', 'Evil Sorcery')
      .sub('contact.html', 'http://lev.io')
      .sub('The OT-One is a personal liquid handling robot.', 'The OT-One is a black magic powered liquid handling robot.')
      .sub('$3000', '$3000 (and a sacrificial offering of a goat)')
      .sub('Serial dilutions', 'Necromancy')
      .sub('Various assays (ie ELISA)', 'Blood Magic')
      .sub('Master mix and PCR', 'Immortality')
      .sub('Gibson Assembly', 'Summoning Demons')
      .sub('Transformations', 'Various alchemy procedures')
      .gsub('OpenTrons', 'ClosedTrons')
    Rack::Response.new(body)
  end
end
