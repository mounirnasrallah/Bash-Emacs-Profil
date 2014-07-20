DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -fs "$DIR"/bashrc ~/.bashrc
ln -fs "$DIR"/bashrc ~/.profile
ln -fs "$DIR"/emacs ~/.emacs
ln -Fis "$DIR"/emacs.d ~/.emacs.d
