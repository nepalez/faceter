# encoding: utf-8

guard :rspec, cmd: "bundle exec rspec" do

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/faceter/(.+)\.rb$}) { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch("lib/faceter.rb")           { "spec"                          }
  watch("spec/spec_helper.rb")      { "spec"                          }

end # guard :rspec
