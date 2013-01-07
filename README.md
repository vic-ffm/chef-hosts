Description
===========

The hosts cookbook configures the /etc/hosts file.

Requirements
============

Tested on Ubuntu 12

Attributes
==========

* `node['hosts']['localhost_aliases']` - An array of aliases for the node. Defaults to [].
* `node['hosts']['entries']` - A map between ip address and domain name. Defaults to {}.

Usage
=====

The following recipes provided:

* `hosts::default` - Install the GlassFish binaries.
