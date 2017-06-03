## Combined code for Courses ML course by Andrew Ng

### Setup
If you haven't installed X11 and Octave on your Mac OS X,
then need to setup:

https://adampash.com/how-to-install-octave/


Use Homebrew.

# install Homebrew http://brew.sh/ if you don't already have it 
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# tap the science formulae
brew tap homebrew/science

# install some Octave dependencies
# the update/upgrade command below could take a while
brew update && brew upgrade
#brew install gfortran
brew install gcc

# install octave
brew install octave

# install fltk for gnuplot
brew install fltk

# install gnuplot
brew install gnuplot


## Graphical Plotter Notes

Several graphics toolkit are available. You can select them by using the command
'graphics_toolkit' in Octave.  Individual Gnuplot terminals can be chosen by setting
the environment variable GNUTERM and building gnuplot with the following options:

  setenv('GNUTERM','qt')    # Requires QT; install gnuplot --with-qt5
  setenv('GNUTERM','x11')   # Requires XQuartz; install gnuplot --with-x11
  setenv('GNUTERM','wxt')   # Requires wxmac; install gnuplot --with-wxmac
  setenv('GNUTERM','aqua')  # Requires AquaTerm; install gnuplot --with-aquaterm

You may also set this variable from within Octave. For printing the cairo backend
is recommended, i.e., install gnuplot with --with-cairo, and use

  print -dpdfcairo figure.pdf

