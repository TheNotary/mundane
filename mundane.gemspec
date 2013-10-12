lib = File.expand_path("../lib", __FILE__)
$:.unshift lib unless $:.include? lib

require "mundane/version"

Gem::Specification.new do |s|
  s.name = "mundane"
  s.version = Mundane::VERSION
  s.authors = ""
  s.email = ""
  s.homepage = "https://github.com/TheNotary/files_to_zips"
  s.summary = "Mundane automates the mundane file operations you sometimes wind up needing to do such as unzipping a billion files, or zipping a billion so they work on xbox or w/e"
  s.description = "files2zips - converts a bunch of files into individual .zip files\n  zips2files - unpacks all the zip files in a directory spilling there contents into /out"

  s.rubyforge_project = s.name

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README]

  s.add_dependency 'rubyzip'
  s.add_dependency 'thor'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'

  s.files = Dir.glob("{bin,lib,spec}/**/*") + ['README']
  s.executables = ['mundane']
  s.require_path = ['lib']
end


