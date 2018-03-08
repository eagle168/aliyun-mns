# -*- encoding: utf-8 -*-
# stub: aliyun-mns 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "aliyun-mns".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["mgampkay".freeze, "skinnyworm".freeze]
  s.date = "2015-12-15"
  s.description = "Non-official SDK for Aliyun MNS".freeze
  s.email = ["mgampkay@gmail.com".freeze, "askinnyworm@gmail.com".freeze]
  s.executables = ["mqs".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "aliyun-mns.gemspec".freeze, "bin/mqs".freeze, "lib/aliyun/mns.rb".freeze, "lib/aliyun/mns/batch_message.rb".freeze, "lib/aliyun/mns/cli.rb".freeze, "lib/aliyun/mns/message.rb".freeze, "lib/aliyun/mns/queue.rb".freeze, "lib/aliyun/mns/request.rb".freeze, "lib/aliyun/mns/version.rb".freeze, "spec/lib/aliyun/mns/message_spec.rb".freeze, "spec/lib/aliyun/mns/queue_spec.rb".freeze, "spec/lib/aliyun/mns/request_spec.rb".freeze, "spec/spec_helper.rb".freeze, "tags".freeze]
  s.homepage = "https://github.com/mgampkay/aliyun-mns".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Ruby SDK for Aliyun MNS (non-official)".freeze
  s.test_files = ["spec/lib/aliyun/mns/message_spec.rb".freeze, "spec/lib/aliyun/mns/queue_spec.rb".freeze, "spec/lib/aliyun/mns/request_spec.rb".freeze, "spec/spec_helper.rb".freeze]

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.6"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.1"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.6"])
      s.add_dependency(%q<activesupport>.freeze, [">= 4.1"])
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_dependency(%q<thor>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.6"])
    s.add_dependency(%q<activesupport>.freeze, [">= 4.1"])
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
