#! /bin/sh
##
## Remove Xcode's local project files from git.
## Execute once just after new Xcode project is created.
##
## Usage: xcode-remove-local-project-from-git.sh
##

## Current directory mus be top git repository
if [ ! -d ./.git ]; then
    echo "Must be executed at directory which includes .git"
    exit 1
fi

## Crete gitignore
echo "Create .gitignore"
cat >.gitignore <<EOF
# Created by https://www.gitignore.io/api/xcode,swift,objective-c,osx

### Xcode ###
# Xcode
#
# gitignore contributors: remember to update Global/Xcode.gitignore, Objective-C.gitignore & Swift.gitignore

## Build generated
build/
DerivedData

## Various settings
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata

## Other
*.xccheckout
*.moved-aside
*.xcuserstate


### Swift ###
# Xcode
#
# gitignore contributors: remember to update Global/Xcode.gitignore, Objective-C.gitignore & Swift.gitignore

## Build generated
build/
DerivedData

## Various settings
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata

## Other
*.xccheckout
*.moved-aside
*.xcuserstate
*.xcscmblueprint

## Obj-C/Swift specific
*.hmap
*.ipa

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# http://guides.cocoapods.org/using/using-cocoapods.html#should-i-ignore-the-pods-directory-in-source-control
#
# Pods/

# Carthage
#
# Add this line if you want to avoid checking in source code from Carthage dependencies.
# Carthage/Checkouts

Carthage/Build


### Objective-C ###
# Xcode
#
# gitignore contributors: remember to update Global/Xcode.gitignore, Objective-C.gitignore & Swift.gitignore

## Build generated
build/
DerivedData

## Various settings
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata

## Other
*.xccheckout
*.moved-aside
*.xcuserstate
*.xcscmblueprint

## Obj-C/Swift specific
*.hmap
*.ipa

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# http://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
#
#Pods/

# Carthage
#
# Add this line if you want to avoid checking in source code from Carthage dependencies.
# Carthage/Checkouts

Carthage/Build

### Objective-C Patch ###
*.xcscmblueprint


### OSX ###
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon


# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
EOF

## Add .gitignore
git add .gitignore
git commit -m "Add .gitignore"

## Remove local project files
echo "Removing local project files"
LIST=`git ls-files -i --exclude-from=.gitignore`

for i in $LIST
do
echo $i
git rm -f --cached $i
done

## Commit local removal.
git commit -m "Remove local project files from git"
