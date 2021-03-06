# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{butterfly}
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = %q{2009-04-09}
  s.default_executable = %q{flutter}
  s.email = %q{arilerner@mac.com}
  s.executables = ["flutter"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["History.txt", "PostInstall.txt", "Rakefile", "README.rdoc", "VERSION.yml", "bin/flutter", "examples/config.ru", "examples/my_app.rb", "lib/butterfly.rb", "lib/handler.rb", "lib/request.rb", "lib/response.rb", "test/test_adapter_base.rb", "test/test_butterfly_request.rb", "test/test_butterfly_response.rb", "test/test_butterfly_server.rb", "test/test_default.rb", "test/test_helper.rb", ".gitignore"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/auser/butterfly}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An HTTP mini server to query against modular adaptors}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0.9"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.3"])
    else
      s.add_dependency(%q<rack>, [">= 0.9"])
      s.add_dependency(%q<json>, [">= 1.1.3"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0.9"])
    s.add_dependency(%q<json>, [">= 1.1.3"])
  end
end
