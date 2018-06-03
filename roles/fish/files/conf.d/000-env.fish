if test -d ~/.rbenv
  set -x -g RBENV_HOME ~/.rbenv
  set -x -g PATH $RBENV_HOME/bin $PATH
end
