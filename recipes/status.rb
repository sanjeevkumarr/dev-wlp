bash "server-status" do
      code 'sh /opt/wlp/bin/server status'
      returns [0]
end
