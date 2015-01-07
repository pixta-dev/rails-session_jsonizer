begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SessionJsonizer'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :spec do
  Dir.chdir './spec/dummy' do
    system 'bundle exec rspec' or abort
  end
end

task :setup_spec do
  Dir.chdir './spec/dummy' do
    system 'RAILS_ENV=test bundle exec rake db:create' or abort
    system 'RAILS_ENV=test bundle exec rake db:migrate' or abort
  end
end

task :default => :spec

Bundler::GemHelper.install_tasks
