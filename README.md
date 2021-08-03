# renimders
A simple and working-in-progress program for sending notification for reminds you something trough the terminal written in nim 

The code is not complete, still need a way to run checkrmd with something like a systemd service or similar, add a little gui and add more options and help

Also need to add an installer (see next paragraph)

# install

For now the installation process is not added yes, but is pretty easy to install by himselves

here how to
```
git clone github.com/dBasdk/renimders
cd renimders
nim c renimders.nim
nim c checkrmd.nim
sudo mv /usr/bin/renimders
sudo mv /usr/bin/checkrmd
mkdir ~/rmd
touch ~/rmd/rmds
```
done this stuff you just need to setup something to run always checkrmd

all the installation process will be added very soon

# dependecies

This software needs
- notify-send       which can be easily installed trough sudo pacman -S libnotify (archlinux), sudo dnf install libnotify (fedora) and 
                    sudo apt-get install libnotify-bin (debian)
- nim (for compilation and will no longer needed on release)

# warnings

This program is only being tested with fedora linux with gnome and archlinux with kde, but should work with any linux distribution

But this program will not works for sure on windows (i plan to fix this) and maybe could work on macos idk tbh
