## Background
This puppet code intends to put up a standalone CI box running Jenkins behind Nginx.

## Setting up /etc/puppet directory
```bash
sudo su root
rm -rf /etc/puppet
pushd /etc/puppet
git init; git remote add origin https://github.com/patcadelina/puppet-ci.git
git pull origin master
```

## Downloading dependencies (external modules)
[Ruby](https://www.ruby-lang.org/en/) should be installed, alternatively opt to use [rvm](https://rvm.io/).
```bash
sudo su root
gem install bundler
pushd /etc/puppet
r10k puppetfile install
```

## Running puppet
```bash
sudo puppet apply --modulepath=/etc/puppet/ext_modules:/etc/puppet/modules /etc/puppet/manifest/site.pp
```
