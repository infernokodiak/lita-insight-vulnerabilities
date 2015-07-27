require "spec_helper"

describe Lita::Handlers::Insight, lita_handler: true do
  before do
    config_values = YAML.load_file('config.yml')
    registry.config.handlers.insight.tap do |config|
      config.username = "#{config_values[:username]}"
      config.password = "#{config_values[:password]}"
    end
  end

  it { is_expected.to route('vulnerabilities') }

  it 'responds to vulnerabilities' do
    send_message 'vulnerabilities'
    expect { replies.last }.to_not raise_error
  end

  # it 'responds to echo' do
  #   send_message 'echo echo_this'
  #   expect(replies.last).to eq 'echo_this'
  # end
end
