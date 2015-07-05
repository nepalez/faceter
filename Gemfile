source "https://rubygems.org"

gemspec

group :metrics do
  gem "hexx-suit", "~> 2.2" if RUBY_ENGINE == "ruby"
end

gem "thread_safe" # Why on earth I need this here?!
gem(
  "abstract_mapper",
  github: "nepalez/abstract_mapper",
  branch: "singleton-transprocs"
)
gem(
  "transproc",
  github: "solnic/transproc",
  branch: "switch-to-singleton-methods"
)
