bash "stop-server" do
      code 'sh /opt/wlp/bin/server stop'
      returns [0, 1]
end
bash "restart-server" do
      code 'sh /opt/wlp/bin/server start'
      returns [0]
end
