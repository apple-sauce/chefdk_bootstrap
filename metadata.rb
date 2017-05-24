# Copyright 2017 Apple-Sauce
#
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/apple-sauce/chefdk_bootstrap/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/apple-sauce/chefdk_bootstrap'

name              'chefdk_bootstrap'
maintainer        'Apple-Sauce'
maintainer_email  'Apple-Sauce@Saucey.com'
license           'All Rights Reserved'
description       'Installs/Configures laptop with chefdk and other tools needed to code with chef'
long_description  'Installs/Configures the following tools:
                   ChefDK 1.3.43
                   Chocolatey: latest
                   ConEmu: latest
                   Visual Studio Code: latest
                   Vagrant: 1.9.1
                   Virtual Box: 5.0.34'
version           '0.1.7'

chef_version      '>= 12.1' if respond_to?(:chef_version)
