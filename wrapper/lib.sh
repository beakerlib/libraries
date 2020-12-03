#!/bin/bash
# vim: dict+=/usr/share/beakerlib/dictionary.vim cpt=.,w,b,u,t,i,k
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   a library wrapper helper
#   Description: a library wrapper hepler to simplify library download from non-standart locations
#   Author: Dalibor Pospisil <dapospis@redhat.com>
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   Copyright (c) 2020 Red Hat, Inc.
#
#   This program is free software: you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation, either version 2 of
#   the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be
#   useful, but WITHOUT ANY WARRANTY; without even the implied
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#   PURPOSE.  See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see http://www.gnu.org/licenses/.
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   library-prefix = LibrariesWrapper
#   library-version = 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

true <<'=cut'
=pod

=head1 NAME

Libraries Wrapper

=head1 DESCRIPTION

This is helper library to get libraries form a nonstandard locations.

=cut


LibrariesWrapperImport() {
  local res url ref path fullpath PREFIX VERSION


  url="$1"
  ref="${2:-HEAD}"
  path="$3"

  res=0
  pushd "$(dirname ${BASH_SOURCE[1]})" > /dev/null
  if [[ -d .git ]]; then
    rlLogInfo "$FUNCNAME(): library fetched already"
  else
    rlLogInfo "$FUNCNAME(): library not fetched yet"
    rlRun "git init" \
    && rlRun "git remote add origin $url" \
    && rlRun "git fetch"
  fi
  rlRun "git checkout $ref -- $path"
  [[ $? -eq 0 ]] \
  && {
    fullpath=$(readlink -e "$path")
    PREFIX="$( grep -E 'library-prefix = [a-zA-Z_][a-zA-Z0-9_]*.*' $path/lib.sh | sed 's|.*library-prefix = \([a-zA-Z_][a-zA-Z0-9_]*\).*|\1|')"
    VERSION="$( grep -E '^#\s*library-version = \S*' $path/lib.sh | sed 's|.*library-version = \(\S*\).*|\1|')"
    rlLogInfo "real $PREFIX library version $VERSION from $url#$ref/$path found in $fullpath"
  } \
  && bash -n $path/lib.sh \
  && {
    rlLogDebug "$FUNCNAME(): sourcing $path/lib.sh"
    . $path/lib.sh
  } \
  && {
    rlLogDebug "$FUNCNAME(): running library verifier (${PREFIX}LibraryLoaded)"
    eval "${PREFIX}LibraryLoaded"
  } \
  && {
    rlLogDebug "$FUNCNAME(): setting ${PREFIX}LibraryDir=$fullpath"
    eval "${PREFIX}LibraryDir=$fullpath"
  } \
  || res=1
  popd > /dev/null
  return $res
}

LibrariesWrapperLibraryLoaded() {
  which git > /dev/null 2>&1
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Authors
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

true <<'=cut'
=pod

=head1 AUTHORS

=over

=item *

Dalibor Pospisil <dapospis@redhat.com>

=back

=cut
