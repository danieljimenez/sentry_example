require 'serverspec'

set :backend, :exec

%w[ nginx.x86_64 ].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
