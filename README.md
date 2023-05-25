# Beakerlib Libraries

## Introduction

In order to prevent unnecessary test code duplication it makes
sense to use a test library which implements frequently repeated
actions. Beakerlib Libraries allow to create and share modules,
encapsulating common complex tasks such as configuring and
starting a particular daemon in a single function. Also, the
library takes care of installing all the necessary dependencies.

## Location

The default location for libraries is the [beakerlib][beakerlib]
project.  Libraries stored there can be easily referenced using
the `library(component/name)` notation in the [require][require]
attribute.  It is recommended to create a separate git repository
for each library unless there are multiple libraries which are
very closely related. Note that you will be able to set up
collaborators for your library repository.

## Create

In order to create a git repository for a new library file a new
[issue][new] in this project and specify the desired name.


## Develop

As every change in the library can affect many tests which depend
on it, it is strongly recommended to always use pull requests when
developing new features and fixing bugs and require at least one
review from collaborators before merging the code to production.

[beakerlib]: https://github.com/beakerlib/
[new]: https://github.com/beakerlib/libraries/issues/new
[require]: https://tmt.readthedocs.io/en/latest/spec/tests.html#require

## List

| name | summary | contact |
| ---- | ------- | ---- |
| [bind/bind-setup](https://github.com/beakerlib/bind/tree/master/bind-setup/) | setup functions for bind | Petr Sklenar <psklenar@redhat.com> |
| [bind/bind-utils](https://github.com/beakerlib/bind/tree/master/bind-utils/) | Few helpers for working with DNS and DNSSEC in tests. | Petr Mensik <pemensik@redhat.com> |
| [ControlFlow/Cleanup](https://github.com/beakerlib/ControlFlow/tree/master/Cleanup/) | Provides function to define cleanup stack which can do its work at any time | Dalibor Pospisil <dapospis@redhat.com> |
| [ControlFlow/ConditionalPhases](https://github.com/beakerlib/ControlFlow/tree/master/ConditionalPhases/) | Implements conditional phases. | Dalibor Pospíšil <dapospis@redhat.com> |
| [ControlFlow/mcase](https://github.com/beakerlib/ControlFlow/tree/master/mcase/) | modal test case library | mmacura@redhat.com |
| [ControlFlow/SessionControl](https://github.com/beakerlib/ControlFlow/tree/master/SessionControl/) | Sessions handling library | Dalibor Pospíšil <dapospis@redhat.com> |
| [crypto/fips](https://github.com/beakerlib/crypto/tree/master/fips/) | A set of helpers for FIPS 140 testing | Ondrej Moris <omoris@redhat.com> |
| [database/mariadb](https://github.com/beakerlib/database/tree/master/mariadb/) | Set of basic functions for mariadb | Jakub Heger <jheger@redhat.com> |
| [database/mysql](https://github.com/beakerlib/database/tree/master/mysql/) | Set of basic functions for mysql | Jakub Heger <jheger@redhat.com> |
| [database/postgresql](https://github.com/beakerlib/database/tree/master/postgresql/) | Set of basic functions for postgresql | Vaclav Danek <vdanek@redhat.com> |
| [distribution/Cleanup](https://github.com/beakerlib/distribution/tree/master/Cleanup/) | Cleanup library reference | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/ConditionalPhases](https://github.com/beakerlib/distribution/tree/master/ConditionalPhases/) | ConditionalPhases library reference | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/dpcommon](https://github.com/beakerlib/distribution/tree/master/dpcommon/) | A meta library bringing other libraries | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/dump](https://github.com/beakerlib/distribution/tree/master/dump/) | Helpers for dumping files to log | Alois Mahdal <amahdal@redhat.com> |
| [distribution/epel](https://github.com/beakerlib/distribution/tree/master/epel/) | epel library reference | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/Log](https://github.com/beakerlib/distribution/tree/master/Log/) | More fine-grade logging solution | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/mcase](https://github.com/beakerlib/distribution/tree/master/mcase/) | mcase library reference | Martin Klusoň <mkluson@redhat.com> |
| [distribution/opts](https://github.com/beakerlib/distribution/tree/master/opts/) | simplified interface to getopts processing | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/RpmSnapshot](https://github.com/beakerlib/distribution/tree/master/RpmSnapshot/) | RpmSnapshot library reference | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/static](https://github.com/beakerlib/distribution/tree/master/static/) | static file checking | Alois Mahdal <amahdal@redhat.com> |
| [distribution/sync](https://github.com/beakerlib/distribution/tree/master/sync/) | sync library reference | Ondrej Moris <omoris@redhat.com> |
| [distribution/tcf](https://github.com/beakerlib/distribution/tree/master/tcf/) | Block style coding with ability of skipping parts | Dalibor Pospíšil <dapospis@redhat.com> |
| [distribution/testUser](https://github.com/beakerlib/distribution/tree/master/testUser/) | This library provides functions for maintaining test users. | Dalibor Pospisil <dapospis@redhat.com> |
| [epel/epel](https://github.com/beakerlib/epel/tree/master/epel/) | EPEL handling | Dalibor Pospíšil <dapospis@redhat.com> |
| [example/file](https://github.com/beakerlib/example/tree/master/file/) | Example of a beakerlib library | Petr Šplíchal <psplicha@redhat.com> |
| [firewalld/main](https://github.com/beakerlib/firewalld/tree/master/main/) | Manage firewalld setup and cleanup | Tomas Dolezal <todoleza@redhat.com> |
| [httpd/http](https://github.com/beakerlib/httpd/tree/master/http/) | Basic library for httpd testing | Ondřej Pták <optak@redhat.com> |
| [initscripts/basic](https://github.com/beakerlib/initscripts/tree/master/basic/) | it contains nm handling and similation tools | Petr Sklenar <psklenar@redhat.com> |
| [libraries/wrapper](https://github.com/beakerlib/libraries/tree/master/wrapper/) | a library wrapper helper | Dalibor Pospíšil <dapospis@redhat.com> |
| [nginx/nginx](https://github.com/beakerlib/nginx/tree/master/nginx/) | library for testing nginx | Ondrej Ptak <optak@redhat.com> |
| [nvr/nvr](https://github.com/beakerlib/nvr/tree/master/nvr/) | Library allows easily compare NVR of an installed package | Karel Srot <ksrot@redhat.com> |
| [openssl/certgen](https://github.com/beakerlib/openssl/tree/master/certgen/) | Library for creating X.509 certificates for any use |  |
| [perl/subpackage](https://github.com/beakerlib/perl/tree/master/subpackage/) | Library of functions regarding the perl subpackages | Martin Kyral <mkyral@redhat.com> |
| [php/utils](https://github.com/beakerlib/php/tree/master/utils/) | Library with various utility functions for php tests | David Kutalek <dkutalek@redhat.com> |
| [rpm/snapshot](https://github.com/beakerlib/rpm/tree/master/snapshot/) | RpmSnapshot library | Dalibor Pospíšil <dapospis@redhat.com> |
| [rsyslog/basic](https://github.com/beakerlib/rsyslog/tree/master/basic/) | basic functions to support rsyslog | Dalibor Pospíšil <dapospis@redhat.com> |
| [selinux-policy/common](https://github.com/beakerlib/selinux-policy/tree/master/common/) | library(selinux-policy) wrapper | Dalibor Pospíšil <dapospis@redhat.com> |
| [sos/utils](https://github.com/beakerlib/sos/tree/master/utils/) | Library with various utility functions for sos tests | David Kutalek <dkutalek@redhat.com> |
| [squid/squid](https://github.com/beakerlib/squid/tree/master/squid/) | Library for squid testing | Martin Kyral <mkyral@redhat.com> |
| [sync/sync](https://github.com/beakerlib/sync/tree/master/sync/) | A simple synchronization library for two hosts | Ondrej Moris <omoris@redhat.com> |
| [tuned/basic](https://github.com/beakerlib/tuned/tree/master/basic/) | Library for tuned | rhack@redhat.com |
| [wrapper](https://github.com/beakerlib/wrapper/) | a library wrapper helper | Dalibor Pospíšil <dapospis@redhat.com> |
