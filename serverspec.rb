# テストコード
require 'spec_helper'

listen_port = 80

describe package('nginx') do
  it { should be_installed }
end

describe port(listen_port) do
  it { should be_listening }
end

describe package('git') do
  it { should be_installed }
end

describe package('unicorn') do
  it { should be_installed.by('gem')}
end

describe command('curl http://18.181.201.238:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
its(:stdout) { should match /^200$/ }
end


#実行結果
Package "nginx"
  is expected to be installed

Port "80"
  is expected to be listening

Package "git"
  is expected to be installed

Package "unicorn"
  is expected to be installed by "gem"

Command "curl http://18.181.201.238:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s"
  stdout
    is expected to match /^200$/

Finished in 0.51344 seconds (files took 1.51 seconds to load)
6 examples, 0 failures, 1 pending