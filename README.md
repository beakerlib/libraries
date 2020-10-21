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

[beakerlib]: https://github.com/beakerlib/
[new]: https://github.com/beakerlib/libraries/issues/new
[require]: https://tmt.readthedocs.io/en/latest/spec/tests.html#require
