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
#   library-version = 6
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
  ref="$2"
  path="${3#/}"

  res=0
  pushd "$(dirname ${BASH_SOURCE[1]})" > /dev/null
  mkdir -p lib
  cd lib
  if [[ -d .git ]]; then
    rlLogInfo "$FUNCNAME(): library fetched already"
    # update the library if checked more than 1h ago
    if [[ $(( $(date +%s) - $(stat --format=%Y ".git/config") )) -gt 3600 ]]; then
      rlLogInfo "the library was fetched at least 1h ago, checking for updates"
      rlRun "git config core.bare true"
      rlRun "git remote update"
      rlRun "git config core.bare false"
    fi
  else
    rlLogInfo "$FUNCNAME(): library not fetched yet"
    rlRun "git clone --mirror \"${url}\" .git" \
    && rlRun "git config core.bare false" \
    && rlRun "cat .git/HEAD > .git/refs/heads/__DEFAULT_BRANCH__"
  fi
  [[ -z "${ref}" ]] && {
    ref=$(git rev-parse --abbrev-ref __DEFAULT_BRANCH__) \
      || rlFail "Couldn't refer to the default branch for git repo $path"
  }
  rlRun "git checkout \"${ref}\" -- \"${path:-.}\""
  [[ $? -eq 0 ]] \
  && {
    fullpath=$(readlink -e "$path")
    PREFIX="$( grep -E 'library-prefix = [a-zA-Z_][a-zA-Z0-9_]*.*' $path/lib.sh | sed 's|.*library-prefix = \([a-zA-Z_][a-zA-Z0-9_]*\).*|\1|')"
    VERSION="$( grep -E '^#\s*library-version = \S*' $path/lib.sh | sed 's|.*library-version = \(\S*\).*|\1|')"
    rlLogInfo "found $PREFIX v$VERSION from ${url}?$(git rev-parse "${ref}")#${path} in $fullpath"
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
  command -v git > /dev/null 2>&1
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
