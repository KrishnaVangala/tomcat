#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, Krishna Vangala, All Rights Reserved.
package 'java-1.7.0-openjdk-devel' do
  action :install
end
group 'tomcat'

user 'tomcat' do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

remote_file 'apache-tomcat-8.5.20.tar.gz' do
  source 'http://apache.parentingamerica.com/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz'
  action :create
end
directory '/opt/tomcat' do
end
# TODO: This is idempotent
execute 'tar xvf apache-tomcat-8.5.20.tar.gz -C /opt/tomcat --strip-components=1 '
execute 'chgrp -R tomcat /opt/tomcat/conf'
directory '/opt/tomcat/conf' do
    mode '0070'
end
execute 'chmod g+r /opt/tomcat/conf/*'
execute 'chown -R tomcat /opt/tomcat/webapps /opt/tomcat/work /opt/tomcat/temp /opt/tomcat/logs'
template '/etc/systemd/system/tomcat.service' do
    source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

service 'tomcat.service' do
  action [:start, :enable]
end
