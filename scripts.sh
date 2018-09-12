sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum install -y puppetserver
systemctl start puppetserver
systemctl enable puppetserver
export PATH=/opt/puppetlabs/bin:$PATH


sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum install -y puppet-agent
export PATH=/opt/puppetlabs/bin:$PATH
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

add to site.pp

node 'agent.gwynne.local' {
  file {'/puppetfile.txt':
    ensure => 'present',
      content => "This was created by the Puppet Master!"
       }
  package {'tree' :
	   ensure => 'installed'
	   }
}
