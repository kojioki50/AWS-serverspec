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
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
  is expected to be installed

Port "80"
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
  is expected to be listening

Package "git"
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
  is expected to be installed

Package "unicorn"
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
  is expected to be installed by "gem"

Command "curl http://18.181.201.238:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s"
  stdout
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
No backend type is specified. Fall back to :exec type.
    is expected to match /^200$/

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) FruitHelper add some examples to (or delete) /home/ec2-user/raisetech-live8-sample-app/spec/helpers/fruit_helper_spec.rb
     # Not yet implemented
     # ./spec/helpers/fruit_helper_spec.rb:14


Finished in 0.49584 seconds (files took 1.57 seconds to load)
6 examples, 0 failures, 1 pending

[ec2-user@ip-10-0-1-81 raisetech-live8-sample-app]$ 