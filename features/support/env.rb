require 'aruba/cucumber'

Before('@no-clobber') do
  $hew_installed ||= false

  unless $hew_installed
    setup_aruba
    step 'install Hew'
    $hew_installed = true
  end
end
