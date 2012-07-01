Gem::Specification.new do |s|
              s.name = 'mcarlo'
           s.version = "2.08"
              s.date = Time.now
           s.summary = 'mcarlo - MonteCarlo simulation for projects'
       s.description = 'see README'
            s.author = 'Wybo Dekker'
             s.email = 'wybo@dekkerdocumenten.nl'
          s.homepage = 'http://www.dekkerdocumenten.nl'
s.default_executable = 'mcarlo'
          s.has_rdoc = true
      s.rdoc_options = ["--main", "lib/README"]
             s.files = ['bin/mcarlo'] + Dir["test/*"]
  s.extra_rdoc_files = "lib/README"
       s.executables = "mcarlo"
            s.bindir = 'bin'
end
# $Id$
