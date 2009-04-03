# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{butterfly}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["FIXME full name"]
  s.date = %q{2009-04-03}
  s.description = %q{An HTTP mini server to query against modular adaptors}
  s.email = ["FIXME email"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "butterfly.rb", "lib/butterfly.rb", "script/console", "script/destroy", "script/generate", "test/test_butterfly.rb", "test/test_helper.rb", "test/test_butterfly_request.rb", "test/test_butterfly_server.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://blog.xnot.org}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{butterfly}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An HTTP mini server to query against modular adaptors}
  s.test_files = ["test/test_butterfly_request.rb", "test/test_butterfly_server.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
