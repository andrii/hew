Then /^the example(?:s)? should(?: all)? fail$/ do
  step %q{the output should not contain "0 examples"}
  step %q{the output should not contain "0 failures"}
  step %q{the exit status should be 1}
  all_output = all_commands.map { |c| c.output }.join("\n")
  example_summary = /(\d+) examples?, (\d+) failures?/.match(all_output)
  example_count, failure_count = example_summary.captures
  expect(failure_count).to eq(example_count)
end

Then /^the example(?:s)? should(?: all)? pass$/ do
  step %q{the output should contain "0 failures"}
  step %q{the output should not contain "0 examples"}
  step %q{the exit status should be 0}
end
