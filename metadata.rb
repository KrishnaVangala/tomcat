name 'tomcat'
maintainer 'Krishna Vangala'
maintainer_email 'saichaitanya6@gmail.com'
license 'GNU General Public License v3.0'
description 'Installs/Configures tomcat'
long_description 'This cookbook when ran will install tomcat, creates tomcat (group and user), configure the permissions to tomcat for the tomcat folder. It will also create a Systemd script, so that tomcat can be used from the Systemd.'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
supports -> 'CentOS'
source_url 'https://github.com/KrishnaVangala/tomcat.git'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/tomcat/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/tomcat'
