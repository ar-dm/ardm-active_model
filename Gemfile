require 'pathname'

source 'https://rubygems.org'

gemspec

SOURCE         = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX   = SOURCE == :path ? ''                                : '.git'
DATAMAPPER     = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'https://github.com/ar-dm'
DM_VERSION     = '~> 1.2'
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')
RAILS_VERSION  = [ '>= 3.0', '< 5.0' ]

gem 'ardm-core',     DM_VERSION, SOURCE  => "#{DATAMAPPER}/ardm-core#{REPO_POSTFIX}", :branch => CURRENT_BRANCH
gem 'activemodel', RAILS_VERSION, :require => nil

group :development do
  gem 'ardm-validations', DM_VERSION, SOURCE  => "#{DATAMAPPER}/ardm-validations#{REPO_POSTFIX}", :branch => CURRENT_BRANCH
end

platforms :mri_18 do
  group :quality do

    gem 'rcov',      '~> 0.9.10'
    gem 'yard',      '~> 0.7.2'
    gem 'yardstick', '~> 0.4'

  end
end

group :datamapper do

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, SOURCE  => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}", :branch => CURRENT_BRANCH
  end

end
