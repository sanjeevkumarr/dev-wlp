name             'wlp'
maintainer       'prakash'
maintainer_email 'prakash@appranix.com'
license          'All rights reserved'
description      'Installs/Configures create'
long_description 'Installs/Configures create'
version          '0.0.2'
depends          'shared'
depends          'javaservicewrapper'

issues_url'https://Prakash-appranix@bitbucket.org/Prakash-appranix/devops-chef-repo.git/issues'
source_url'https://Prakash-appranix@bitbucket.org/Prakash-appranix/devops-chef-repo'

grouping 'default',
         :access => "global",
         :packages => ['base', 'mgmt.catalog', 'mgmt.manifest', 'catalog', 'manifest', 'bom']

attribute 'version',
         :description => "Version",
         :required => "required",
         :default => "16.0.0.3",
         :format => {
             :important => true,
             :help => 'Version of Tomcat',
             :category => '1.Global',
             :order => 1,
             :form => {'field' => 'select', 'options_for_select' => [['16.0.0.3', '16.0.0.3'], ['16.0.0.2', '16.0.0.2']]},
             :pattern => "[0-9\.]+"
         }


attribute 'http_port',
         :description => "HTTP Port",
         :required => "required",
         :default => "9080",
         :format => {
             :help => 'Port tomcat listens on for incoming HTTP requests',
             :category => '2.Server',
             :order => 1,
             :pattern => "[0-9]+"
         }

 attribute 'ssl_port',
           :description => "SSL Port",
           :required => "required",
           :format => {
             :default => "9443",
               :help => 'Secure port tomcat listens on for incoming requests',
               :category => '2.Server',
               :order => 2,
               :pattern => "[0-9]+"
           }

 attribute 'environment',
           :description => 'Environment Variables',
           :data_type => 'hash',
           :default => '{}',
           :format => {
               :help => 'Environment variables here will override ones set in builds',
               :category => '2.Server',
               :order => 3
           }

attribute 'java_options',
         :description => "Java Options",
         :default => "-Djava.awt.headless=true",
         :format => {
             :help => 'JVM command line options',
             :category => '3.Java',
             :order => 1
         }
attribute 'system_properties',
         :description => "System Properties",
         :data_type => 'hash',
         :default => "{}",
         :format => {
             :important => true,
             :help => 'Key value pairs for -D args to the jvm',
             :category => '3.Java',
             :order => 2
         }

attribute 'mem_max',
         :default => '128M',
         :description => "Max Heap Size",
         :format => {
             :important => true,
             :help => 'Max Memory Heap Size',
             :category => '3.Java',
             :order => 3
         }
attribute 'mem_start',
     :default => '128M',
     :description => "Start Heap Size",
     :format => {
         :help => 'Start Memory Heap Size',
         :category => '3.Java',
         :order => 4
     }

attribute 'pre_shutdown_command',
         :default => '',
         :description => 'Command to be executed before tomcat shutdown is invoked.',
         :data_type => 'text',
         :format => {
             :help => 'Command to be executed before catalina stop is invoked. As an example in case of redundant environment, It can be used to post request (using curl)  which can trigger an ecv failure(response code 503). This will allow lb to take this instance out of traffic. ',
             :category => '4.Advanced',
             :order => 1

           }


recipe 'status', 'Tomcat Status'
recipe 'start', 'Start Tomcat'
recipe 'stop', 'Stop Tomcat'
recipe 'restart', 'Restart Tomcat'
recipe 'repair', 'Repair Tomcat'
//TODO add threaddump recipe for java
recipe 'threaddump','Java Thread Dump'
