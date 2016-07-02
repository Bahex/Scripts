#!/bin/sh
## This script creates two seperate files.

## "native-pkglist" contains a list of packages
## that were installed from the offical repositories
## and can be installed with the following command.
# pacman -S $(cat native-pkglist)

## "foreign-pkglist" contains a list of packages
## that were installed manually by the user.
## They can be installed again manually or with
## an AUR helper(if they are on AUR). For example:
# yaourt -S $(cat foreign-pkglist)
# pacaur -S $(cat foreign-pkglist) 

pacman -Qqet | grep -v "`pacman -Qqg base`" | grep -v "`pacman -Qqm`" > native-pkglist

pacman -Qqm > foreign-pkglist

echo "Done"
