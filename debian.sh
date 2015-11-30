#! /bin/sh
# Configure your paths and filenames
SOURCEBINPATH=.
SOURCEBIN=hidblock
SOURCEDOC=README.md
DEBFOLDER=../hidblock
DEBVERSION=0.1

cd hidblock 

git pull origin master

DEBFOLDERNAME=$DEBFOLDER-$DEBVERSION

# Create your scripts source dir
mkdir $DEBFOLDERNAME

# Copy your script to the source dir
cp $SOURCEBINPATH $DEBFOLDERNAME -R
cd $DEBFOLDERNAME

# Create the packaging skeleton (debian/*)
dh_make -s --indep --createorig 

mkdir -p debian/tmp
cp * debian/tmp

# Remove make calls
grep -v makefile debian/rules > debian/rules.new 
mv debian/rules.new debian/rules 

# debian/install must contain the list of scripts to install 
# as well as the target directory
echo $SOURCEBIN usr/bin > debian/install 
echo $SOURCEDOC usr/share/doc/hidblock >> debian/install

# Remove the example files
rm debian/*.ex

# Build the package.
# You  will get a lot of warnings and ../somescripts_0.1-1_i386.deb
debuild -us -uc > ../log 
