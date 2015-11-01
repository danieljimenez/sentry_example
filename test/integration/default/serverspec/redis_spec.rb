require 'serverspec'

set :backend, :exec

%w[ redis.x86_64 ].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe service('redis') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end
