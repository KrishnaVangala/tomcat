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
  #notify the execute of tar file.
  notifies :run, 'execute[tar-extraction]', :immediately
end
directory '/opt/tomcat' do
end
# TODO: This is idempotent
execute 'tar-extraction' do
  command 'tar xvf apache-tomcat-8.5.20.tar.gz -C /opt/tomcat --strip-components=1'
  action :nothing
end

# execute 'tar xvf apache-tomcat-8.5.20.tar.gz -C /opt/tomcat --strip-components=1 '
#execute 'chgrp -R tomcat /opt/tomcat/conf'
directory '/opt/tomcat/conf' do
    mode '0070'
    notifies :run, 'execute[perm-change]',:immediately
end

execute 'perm-change' do
  command 'chgrp -R tomcat /opt/tomcat/conf'
  command 'chmod g+r /opt/tomcat/conf/*'
  command 'chown -R tomcat:tomcat /opt/tomcat/'
  action :run
end

#execute 'chmod g+r /opt/tomcat/conf/*'
#execute 'chown -R tomcat:tomcat /opt/tomcat/'
template '/etc/systemd/system/tomcat.service' do
    source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

service 'tomcat.service' do
  action [:start, :enable]
end
