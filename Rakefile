#!/usr/bin/env rake
# -*- Ruby -*-
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/testtask'
require 'fileutils'

@thismod = 'mcarlo'
@gemroot = '/www/wdgems'
@gemdir = File.join(@gemroot,'gems')
test(?d,@gemdir) or raise(RuntimeError,"#{@gemdir} does not exist!\n")
ROOT_DIR = File.dirname(__FILE__)
require File.join(ROOT_DIR, "/lib/#{@thismod}/version")
VERSION = eval("#{@thismod.capitalize}::VERSION")

def gemspec
  @gemspec ||= eval(File.read("#{@thismod}.gemspec"), binding, "#{@thismod}.gemspec")
end
@binary = test(?e,'bin') ? File.join(gemspec.bindir,gemspec.name) : nil
@gemname = "#{gemspec.name}-#{gemspec.version}"

# check that the gem's version and the version of the executable and any RELEASE file match
def checkversion
  return unless test(?e,'RELEASE')
  vrel = open('RELEASE') { |f| f.gets.split[3] }
  vbin = open(@binary) do |f|
    f.readlines.each do |l|
      l.sub!(/#.*/,'')
      break if l =~ /Version\s*=\s*['"]?(\d+\.\d+)/
    end
    $1
  end
  return if VERSION == vrel && VERSION == vbin
  puts "Error: non-matching versions - gemspec: #{VERSION} binary: #{vbin} RELEASE file: #{vrel}"
  exit 1
end

# remove everything that can be built
def clean 
  FileUtils.rm_rf(FileList['**/*.{rej,orig}'].to_a)
  FileUtils.rm_rf File.join(ROOT_DIR, 'pkg')
  FileUtils.rm_rf File.join(ROOT_DIR, 'doc')
end

desc "Build the gem"
task :build=>:gemspec do
  Dir.chdir(ROOT_DIR) do
    sh "gem build #{@thismod}.gemspec"
    FileUtils.mkdir_p('pkg')
    FileUtils.mv(@gemname+".gem", 'pkg')
  end
end

desc "Install the gem locally"
task :install => [:uid,:test,:build] do
  Dir.chdir(ROOT_DIR) do
    checkversion if @binary
    puts "Installing in " + File.join(gemspec.base_dir,'gems',@gemname)
    sh %{gem install pkg/#{@gemname}}
    FileUtils.install(File.join("pkg",@gemname+".gem"),@gemdir)
    sh %{gem generate_index -d #{@gemroot}}
  end
  clean
end

desc "Test if we have root permission"
task :uid do
  if Process.uid != 0 
    puts "You must be root to install - use sudo"
    exit 1
  end
end

desc "Test everything."
Rake::TestTask.new(:test) do |t|
  t.libs << './lib'
  t.pattern = 'test/test-*.rb'
  t.verbose = false
end
task :test => :lib

task :default => [:test]

desc "Remove built files"
task :clean do
  clean
end

desc "Generate the gemspec"
task :generate do
  puts gemspec.to_ruby
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

# ---------  RDoc Documentation ------
desc "Generate rdoc documentation"
Rake::RDocTask.new("rdoc") do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "#{@thismod.capitalize} #{VERSION} Documentation"

  # Make the README file the start page for the generated html
  rdoc.options += %w(--main README)

  rdoc.rdoc_files.include('lib/*.rb', 'README')
end

task :help do
  puts <<-EOF
  help	   Print this help
  install  Test, build and install the gem locally
  clean	   Remove built files
  test	   Test everything
  build	   Build the gem
  gemspec  Validate the gemspec
  doc	   Create Ruby docs in doc subdirectory
  EOF
end

#$Id$
