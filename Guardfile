# frozen_string_literal: true

guard :shell do
  watch(%r{^test/(.*)/?test_(.*)\.rb$}) { `bundle exec rake` }
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| `bundle exec ruby -Itest test/#{m[1]}test_#{m[2]}.rb` }
end

# vim: ft=ruby
