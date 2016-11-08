bash "stop-run-stop-server" do
      code 'sh /opt/wlp/bin/server stop'
      returns [0]
end

