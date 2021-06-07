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

| prefix | name | summary | contact | link |
| ------ | ---- | ------- | ------- | ---- |
| squid | squid/squid | Library for squid testing | Martin Kyral <mkyral@redhat.com> | https://github.com/beakerlib/squid/tree/master/squid/ |
| x509Wrapper | openssl/certgen | Library for creating X.509 certificates for any use |  | https://github.com/beakerlib/openssl/tree/master/certgen/ |
| RpmSnapshot | rpm/snapshot | RpmSnapshot library | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/rpm/tree/master/snapshot/ |
| sos | sos/utils | Library with various utility functions for sos tests | David Kutalek <dkutalek@redhat.com> | https://github.com/beakerlib/sos/tree/master/utils/ |
| rlSE | selinux-policy/common | library(selinux-policy) wrapper | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/selinux-policy/tree/master/common/ |
| nginx | nginx/nginx | library for testing nginx | Ondrej Ptak <optak@redhat.com> | https://github.com/beakerlib/nginx/tree/master/nginx/ |
| fwd | firewalld/main | Manage firewalld setup and cleanup | Tomas Dolezal <todoleza@redhat.com> | https://github.com/beakerlib/firewalld/tree/master/main/ |
| nvr | nvr/nvr | Library allows easily compare NVR of an installed package | Karel Srot <ksrot@redhat.com> | https://github.com/beakerlib/nvr/tree/master/nvr/ |
| fips | crypto/fips | A set of helpers for FIPS 140 testing | Ondrej Moris <omoris@redhat.com> | https://github.com/beakerlib/crypto/tree/master/fips/ |
| php | php/utils | Library with various utility functions for php tests | David Kutalek <dkutalek@redhat.com> | https://github.com/beakerlib/php/tree/master/utils/ |
| distribution_dump__ | distribution/dump | Helpers for dumping files to log | Alois Mahdal <amahdal@redhat.com> | https://github.com/beakerlib/distribution/tree/master/dump/ |
| opts | distribution/opts | simplified interface to getopts processing | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/opts/ |
| RpmSnapshotWrapper | distribution/RpmSnapshot | RpmSnapshot library reference | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/RpmSnapshot/ |
| Log | distribution/Log | More fine-grade logging solution | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/Log/ |
| tcf | distribution/tcf | Block style coding with ability of skipping parts | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/tcf/ |
| ConditionalPhasesWrapper | distribution/ConditionalPhases | ConditionalPhases library reference | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/ConditionalPhases/ |
| testUser | distribution/testUser | This library provides functions for maintaining test users. | Dalibor Pospisil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/testUser/ |
| distribution_static__ | distribution/static | static file checking | Alois Mahdal <amahdal@redhat.com> | https://github.com/beakerlib/distribution/tree/master/static/ |
| epelWrapper | distribution/epel | epel library reference | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/epel/ |
| dpcommon | distribution/dpcommon | A meta library bringing other libraries | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/dpcommon/ |
| CleanupWrapper | distribution/Cleanup | Cleanup library reference | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/distribution/tree/master/Cleanup/ |
| LibrariesWrapper | libraries/wrapper | a library wrapper helper | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/libraries/tree/master/wrapper/ |
| perlsub | perl/subpackage | Library of functions regarding the perl subpackages | Martin Kyral <mkyral@redhat.com> | https://github.com/beakerlib/perl/tree/master/subpackage/ |
| basic | tuned/basic | Library for tuned | rhack@redhat.com | https://github.com/beakerlib/tuned/tree/master/basic/ |
| file | example/file | Example of a beakerlib library | Petr Šplíchal <psplicha@redhat.com> | https://github.com/beakerlib/example/tree/master/file/ |
| http | httpd/http | Basic library for httpd testing | Ondřej Pták <optak@redhat.com> | https://github.com/beakerlib/httpd/tree/master/http/ |
| postgresql | database/postgresql | Set of basic functions for postgresql | Vaclav Danek <vdanek@redhat.com> | https://github.com/beakerlib/database/tree/master/postgresql/ |
| mysql | database/mysql | Set of basic functions for mysql | Jakub Heger <jheger@redhat.com> | https://github.com/beakerlib/database/tree/master/mysql/ |
| mariadb | database/mariadb | Set of basic functions for mariadb | Lukas Zachar <lzachar@redhat.com> | https://github.com/beakerlib/database/tree/master/mariadb/ |
| epel | epel/epel | EPEL handling | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/epel/tree/master/epel/ |
| ConditionalPhases | ControlFlow/ConditionalPhases | Implements conditional phases. | Dalibor Pospíšil <dapospis@redhat.com> | https://github.com/beakerlib/ControlFlow/tree/master/ConditionalPhases/ |
| Cleanup | ControlFlow/Cleanup | Provides function to define cleanup stack which can do its work at any time | Dalibor Pospisil <dapospis@redhat.com> | https://github.com/beakerlib/ControlFlow/tree/master/Cleanup/ |
