# # encoding: utf-8

# Inspec test for recipe chefdk_bootstrap::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('Chef Client v12.19.36') do
  it { should be_installed }
end

describe package('Microsoft Visual Studio Code') do
  it { should be_installed }
end

describe package('ConEmu 170402.x64') do
  it { should be_installed }
end

describe package('Oracle VM VirtualBox 5.0.34') do
  it { should be_installed }
end

describe package('Vagrant') do
  it { should be_installed }
end
