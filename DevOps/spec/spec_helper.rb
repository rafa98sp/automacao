require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'

@rspec_yml = YAML.load_file("#{Dir.pwd}/support/rspec.yaml")
@ambiente = @rspec_yml['ambiente']
CONFIG = YAML.load_file("#{Dir.pwd}/support/data/#{@ambiente}.yaml")

#referencia deonde esta o arquivo com o modulo gera_autorizacao
require_relative '../services/gera_autorizacao_services.rb'
require_relative '../services/gera_token_services.rb'

RSpec.configure do |config|

  #modulo esta como global
  include Gera_Autorizacao
  include Gera_Token

  config.color = true
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
