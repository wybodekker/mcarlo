# -*- Ruby -*-
# -*- encoding: utf-8 -*-

@thismod = 'mcarlo'
require 'rake'
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/#{@thismod}/version" unless Object.const_defined?(:"#{@thismod.capitalize}")

Gem::Specification.new do |spec|
  spec.authors      = ['Wybo Dekker']
  spec.date         = Time.now
  spec.description  = 'see README'
  spec.email        = 'wybo@dekkerdocumenten.nl'
  spec.files        = Dir.glob('**/*').delete_if {|x| x =~ /\b(pkg|CVS|tests)\b/}
  spec.homepage     = "http://www.dekkerdocumenten.nl/#{@thismod}"
  spec.name         = @thismod
  spec.platform     = Gem::Platform::RUBY
  spec.require_path = 'lib'
  spec.required_ruby_version = '>= 1.9.3'
  spec.summary      = 'evaluatie van bedrijfsresultaten met MonteCarlo faciliteiten' 
  spec.version      = eval("#{@thismod.capitalize}::VERSION")
  spec.has_rdoc     = true
  spec.extra_rdoc_files = 'README'
  spec.executables = [@thismod]

  # Make the readme file the start page for the generated html
  spec.rdoc_options += %w(--main README)
  spec.rdoc_options += ['--title', "#{@thismod} #{spec.version} Documentation"]
end

# $Id$
