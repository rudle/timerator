Gem::Specification.new do |s|
  s.name = "timerator"
  s.version = "0.1.1"
  s.date = "2010-08-24"
  s.authors = ["Sean Sorrell"]
  s.email = "seansorrell@gmail.com"
  s.summary = "timerator is a time range computing library for ruby"
  s.description = "timerator takes a start and end Time and allows the programmer to iterate for different segments of time "
  s.homepage = "http://github.com/rudle/timerator"
  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib/timerator/'
end

