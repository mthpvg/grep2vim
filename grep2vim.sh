#!/bin/bash

###
#
# grep2vim: is just a custom grep which helps the user to easily look at
# the place where the grep's outpout is pointing at.
#
# It takes two arguments as input : first the options, same as grep,
# second the string your are looking for. Example :
# mgrep -ir subroutine
#
# mgrep exclude binaries, svn and ~ emacs files by default
#
###
#
# Copyright 2013, M. Pavageau
# Mathieu Pavageau, gmail: mth.pvg, twitter: @mthpvg
# Release under GPLv3 license.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
###

boldYellow='\e[1;33m'
defaultColor='\e[0;m'
darkGray='\e[1;30m'
darkPurple='\e[0;35m'
mssgOne="------------------------------------grep2vim------------------------------------"

unset filePath
unset lineNumber
unset matchingLines
IFS=$'\n' #useful for : grep0=($(grep $1 -In --exclude=\*~ $2 * | grep -v \.svn))

echo -e $darkGray$mssgOne$defaultColor
echo -e $darkGray"Please wait..."$defaultColor

grep0=($(grep $1 -In --exclude=\*~ $2 * | grep -v \.svn | grep -v \.git))
((sizeOfGrep=${#grep0[@]}-1))

echo -e $darkGray$mssgOne$defaultColor

#display of the grep's result
for i in `seq 0 $sizeOfGrep` ; do
    filePath[$i]=`echo ${grep0[$i]} | cut -d : -f 1`
    lineNumber[$i]=`echo ${grep0[$i]} | cut -d : -f 2`
    matchingLines[$i]=`echo ${grep0[$i]} | cut -d : -f 3-`

    printf "$boldYellow%-6.5s$defaultColor" "$i"
    echo -en "$boldYellow----$defaultColor"
    echo -en "$darkPurple${filePath[$i]}$defaultColor	"
    echo -e "${matchingLines[$i]}" | grep --color -i $2
done

echo -e $darkGray$mssgOne$defaultColor

nothing=0
while [ $nothing != 'q' ] ; do
    echo -en "$white open file number ('q' to quit) : $defaultColor"
    read nothing
    #opening of the selected file at the number where the occurence appears
    if [ $nothing != 'q' ] ; then
        vim +${lineNumber[$nothing]} ${filePath[$nothing]}
    fi
    echo -e $darkGray$mssgOne$defaultColor
done
