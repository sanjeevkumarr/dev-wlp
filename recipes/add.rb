#
# Cookbook Name:: webpshere
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "java-1.8.0-openjdk" do
   action :install
end

package "java-1.8.0-openjdk-devel" do
  action :install
end

package "wget" do
	action :install
end

package "unzip" do
     action :install
end

remote_file "/opt/wlp-webProfile7-16.0.0.3.zip" do
  source 'https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/wasdev/downloads/wlp/16.0.0.3/wlp-webProfile7-16.0.0.3.zip'
     not_if { File.exist? ('/opt/wlp-webProfile7-16.0.0.3.zip') }
end

execute "extract" do
	command 'unzip -d /opt /opt/wlp-webProfile7-16.0.0.3.zip'
	not_if { File.exist? ('/opt/wlp/bin/server') }
end

bash "create-server" do
      code 'sh /opt/wlp/bin/server start'
      returns [0]
end

cookbook_file '/opt/wlp/usr/servers/defaultServer/server.xml' do
  source 'server.xml'
end
