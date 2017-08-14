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

execute 'tar xvf apache-tomcat-8.5.20.tar.gz -C /opt/tomcat --strip-components=1 '