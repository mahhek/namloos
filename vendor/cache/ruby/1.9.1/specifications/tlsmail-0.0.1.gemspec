# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tlsmail"
  s.version = "0.0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["zorio"]
  s.cert_chain = nil
  s.date = "2007-03-17"
  s.description = "This library enables pop or smtp via ssl/tls by dynamically replacing these classes to these in ruby 1.9."
  s.email = "zoriorz@gmail.com"
  s.homepage = "http://tlsmail.rubyforge.org"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = "tlsmail"
  s.rubygems_version = "1.8.15"
  s.summary = "This library enables pop or smtp via ssl/tls by dynamically replacing these classes to these in ruby 1.9."

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
