module MCollective
  module Agent
    class Who < RPC::Agent
      action 'who' do
        reply[:users] = `/usr/bin/who`.each_line.collect { |l| l =~ /^([^[:blank:]]+)/; $1 }
      end
    end
  end
end
