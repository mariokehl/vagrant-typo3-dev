# Massively inspired by Robert Lemke's httpd-vhosts.conf file at https://gist.github.com/robertlemke/4951820
# thanks a lot for sharing!

#
# Virtual Hosts
#
# If you want to maintain multiple domains/hostnames on your
# machine you can setup VirtualHost containers for them. Most configurations
# use only name-based virtual hosts so the server doesn't need to worry about
# IP addresses. This is indicated by the asterisks in the directives below.
#
# Please see the documentation at 
# <URL:http:/httpd.apache.org/docs/2.2/vhosts/>
# for further details before you try to setup virtual hosts.
#
# You may use the command line option '-S' to verify your virtual host
# configuration.
 
NameVirtualHost *:80
 
<Directory "{{ doc_root }}">
    Options ExecCGI Indexes MultiViews FollowSymLinks Includes
    AllowOverride All
    Order allow,deny
    Allow from all
 
    DirectoryIndex index.php
    UseCanonicalName off
</Directory>
 
<VirtualHost *:80>
    ServerName local.dev
    ServerAlias *.dev
    VirtualDocumentRoot {{ doc_root }}/%-2+/Web
    SetEnv TYPO3_CONTEXT Development
    SetEnv FLOW_CONTEXT Development
</VirtualHost>
 
<VirtualHost *:80>
    ServerName local.prod
    ServerAlias *.prod
    VirtualDocumentRoot {{ doc_root }}/%-2+/Web
    SetEnv TYPO3_CONTEXT Production
    SetEnv FLOW_CONTEXT Production
</VirtualHost>
