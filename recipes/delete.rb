bash "stop-run-stop-server" do
      code 'sh /opt/wlp/bin/server stop'
      returns [0, 1]
end
execute "delete-server" do
        command 'rm -rf /opt/wlp-webProfile7-16.0.0.3.zip'
        command 'rm -rf /opt/wlp'
        only_if { File.exist? ('/opt/wlp/bin/server') }
end

