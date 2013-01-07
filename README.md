Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-hosts.png?branch=master)](http://travis-ci.org/realityforge/chef-hosts)

The hosts cookbook configures the /etc/hosts file.

Requirements
============

Tested on Ubuntu 12

Attributes
==========

* `node['hosts']['aliases']` - An array of aliases for the node. Defaults to [].
* `node['hosts']['entries']` - A map between ip address and domain name. Defaults to {}.

Usage
=====

The following recipes provided:

* `hosts::default` - Configure the /etc/hosts file.
