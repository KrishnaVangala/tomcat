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
