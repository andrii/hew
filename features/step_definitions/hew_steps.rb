Given(/^install Hew$/) do
  step %q(I run `rails new . --skip-spring`)
  step %q(I append to "Gemfile" with "gem 'hew', path: '../..'")
  step %q(I run `bundle install`)
end
