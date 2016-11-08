bash "start-stop-server" do
      code 'sh /opt/wlp/bin/server start'
      returns [0, 1]
end
