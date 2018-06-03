switch (uname)
case Linux
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
case Darwin
  alias ll='ls -alGh'
  alias ls='ls -Gh'
end
