require 'rubygems'

# Use local dm-core if running from a typical dev checkout.
lib = File.join('..', '..', 'dm-core', 'lib')
$LOAD_PATH.unshift(lib) if File.directory?(lib)
require 'dm-core'

# Support running specs with 'rake spec' and 'spec'
$LOAD_PATH.unshift('lib') unless $LOAD_PATH.include?('lib')

require 'dm-active_model'

# test with official active_model lint
require 'active_model/lint'

# run our own specs for the time being. lint still needs to be updated
require 'shared/amo_compliance_spec'

def load_driver(name, default_uri)
  return false if ENV['ADAPTER'] != name.to_s

  begin
    DataMapper.setup(name, ENV["#{name.to_s.upcase}_SPEC_URI"] || default_uri)
    DataMapper::Repository.adapters[:default] =  DataMapper::Repository.adapters[name]
    true
  rescue LoadError => e
    warn "Could not load do_#{name}: #{e}"
    false
  end
end

ENV['ADAPTER'] ||= 'sqlite3'

HAS_SQLITE3  = load_driver(:sqlite3,  'sqlite3::memory:')
HAS_MYSQL    = load_driver(:mysql,    'mysql://localhost/dm_core_test')
HAS_POSTGRES = load_driver(:postgres, 'postgres://postgres@localhost/dm_core_test')


Spec::Runner.configure do |config|

  config.before(:all) do

    # Support testing with(out)
    # dm-validations enabled

    if ENV['USE_DM_VALIDATIONS'] == 'true'
      require 'dm-validations'
    end

  end

end