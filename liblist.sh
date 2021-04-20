#!/bin/bash
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   liblist.sh
#   Generate list of Beakerlib libraries into beakerlib/libraries/README.md
#   Author: Martin Kyral <mkyral@redhat.com>
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#   Copyright (c) 2021 Red Hat, Inc. All rights reserved.
#
#   This copyrighted material is made available to anyone wishing
#   to use, modify, copy, or redistribute it subject to the terms
#   and conditions of the GNU General Public License version 2.
#
#   This program is distributed in the hope that it will be
#   useful, but WITHOUT ANY WARRANTY; without even the implied
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#   PURPOSE. See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public
#   License along with this program; if not, write to the Free
#   Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
#   Boston, MA 02110-1301, USA.

function repoupdate() {
    REPOS=$(curl -H "Accept: json" https://api.github.com/orgs/beakerlib/repos | grep clone_url | awk ' { print $2 }' | sed 's/"//g'  | sed 's/,//' )
    for repo in $REPOS ; do
        LOCALREPO=$(echo $repo | sed 's/.*\///' | sed 's/.git//')
        if [ -d $LOCALREPO ] ; then
            cd $LOCALREPO
            git remote update
            git status -uno | grep -q 'Your branch is behind' && UPDATE=1
            git pull
            echo $?
            cd -
        else
            git clone $repo
        fi
    done
}

function generatetable() {
    TmpDir=$(mktemp -d)
    cat libraries/README.md | grep -v '|' > $TmpDir/README.md
    echo "| prefix | name | summary | contact | link |" >> $TmpDir/README.md
    echo "| ------ | ---- | ------- | ------- | ---- |" >> $TmpDir/README.md
    for lib in $(find . -name lib.sh) ; do
        [ "$lib" = "./test/very/deep/file/lib.sh" ] && continue
        dir=$(echo $lib | sed 's/\/lib.sh//')
        cd $dir
        prefix=$(grep '# *library-prefix = ' lib.sh | sed 's/.* = //')
        name=$(echo $dir | sed 's/\.\///')
        summary=$(grep '^summary: ' main.fmf | sed 's/summary: //')
        contact=$(grep @ main.fmf | sed 's/.*- //' | sed 's/contact: *//')
        ghuri=$(echo $name | sed 's/\//\/tree\/master\//')
        link="https://github.com/beakerlib/$ghuri/"
        echo "| $prefix | $name | $summary | $contact | $link |" >> $TmpDir/README.md
        cd - &>/dev/null
    done
    cat $TmpDir/README.md > libraries/README.md
    echo rm -rf $TmpDir
}

repoupdate
generatetable
