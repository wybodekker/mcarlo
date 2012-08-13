Gem::Specification.new do |s|
              s.name = 'mcarlo'
           s.version = "2.08"
           s.summary = 'mcarlo - MonteCarlo simulation for projects'
       s.description = 'see README'
            s.author = 'Wybo Dekker'
             s.email = 'wybo@dekkerdocumenten.nl'
          s.homepage = 'http://www.dekkerdocumenten.nl'
          s.has_rdoc = true
      s.rdoc_options = ["--main", "README"]
             s.files = ['README',
			'Rakefile',
			'mcarlo.gemspec',
			'bin/mcarlo',
			'lib/mcarlo/version.rb',
		       ] + Dir["tests/*"]
  s.extra_rdoc_files = "README"
       s.executables = "mcarlo"
            s.bindir = 'bin'
end
# $Id$
