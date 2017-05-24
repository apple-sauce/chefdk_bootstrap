# Copyright 2017 Apple-Sauce
#
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/chefdk_bootstrap/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/chefdk_bootstrap'

name              'chefdk_bootstrap'
maintainer        'Apple-Sauce'
maintainer_email  'Apple-Sauce@Saucey.com'
license           'All Rights Reserved'
description       'Installs/Configures chefdk_bootstrap'
long_description  'Installs/Configures chefdk_bootstrap'
version           '0.1.6'

chef_version      '>= 12.1' if respond_to?(:chef_version)
