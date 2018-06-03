# dotfiles

jnsbl's dotfiles, rewritten as Ansible roles. Fully supports macOS. Red Hat and Debian support is good but not as complete.

## Features

- fish (default shell) configured with [fisherman](https://github.com/fisherman/fisherman).
- zsh configured with [prezto](https://github.com/sorin-ionescu/prezto).
- nice fonts for the terminal and coding.
- iterm2 profile (w/ hotkey, themes, etc.)
- neovim with [vim-plug](https://github.com/junegunn/vim-plug) for plugin management.
- [chunkwm](https://github.com/koekeishiya/chunkwm) tiling window manager controlled by [skhd](https://github.com/koekeishiya/skhd).
- pluggable. Everything is optional. Fork this. Remove what you don't use. Configure what you do use.
- Mac packages installed with [homebrew][]. Mac apps installed with [homebrew-cask][].

## Prerequisites (install these first)

- ansible >= 1.6
- homebrew (if on macOS)
- git (homebrew installable on macOS)

## Installation

- [Fork](https://github.com/jnsbl/dotfiles/fork) this repo.
- Clone your fork.

```bash
# Replace git url with your fork
# NOTE: It is important that you clone to ~/dotfiles
$ git clone https://github.com/YOU/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
# Install required Ansible roles
$ sudo ansible-galaxy install -r requirements.yml
```

- Update the following variables in `group_vars/local` (at a minimum)
    - `full_name`: Your name, which will be attached to commit messages, e.g. "Tom Driscoll"
    - `git_user`: Your Github username.
    - `git_email`: Your git email address.
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by [homebrew][], [homebrew-cask][], [mas](https://github.com/mas-cli/mas), and npm.
    - `osx_homebrew_packages`:  Utilities that don't get installed by the roles.
    - `osx_cask_packages`: Mac Apps you want installed with [homebrew-cask][].
    - `mas_installed_apps`: Mac Apps you want installed from Mac App Store.
    - `npm_global_packages`: Node utilities.
    - `fisherman_plugins`: Fisherman plugins.
- Edit `local_env.yml` as you see fit. Remove any roles you don't use. Edit roles that you do use.
- Run the installation script.

```bash
$ ./bin/dot-bootstrap
```

## Updating

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
$ dot
```

## Commands

There are two main commands in the `bin` directory for setting up and updating development environments:

- `dot-bootstrap`: sets up local environment by executing all roles in `local_env.yml`.
- `dot`: updates local environment by executing all roles in `local_env.yml` except for the ones tagged with `bootstrap`.
- `dot-tag`: updates local environment by executing all roles in `local_env.yml` tagged with the specified tag.

## Special files

All configuration is done in `~/dotfiles`. Each role may contain (in addition to the typical ansible directories and files) a number of special files

- **role/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.

## Notes

**iTerm2**

To import the iterm2 profile, go to your iterm2 preferences, and enable "Load preferences from custom folder" and select the iterm2 folder in the `misc/` directory.

![iterm2 profile](https://user-images.githubusercontent.com/2379650/34223487-859f2752-e58d-11e7-8024-9e6af5c1ec4e.png)

**macOS keyboard settings**

There are a few keyboard customizations that must be done manually:

- Turning repeat speed up to 11.

![Keyboard settings](https://user-images.githubusercontent.com/2379650/34223505-91f95072-e58d-11e7-9b36-78aec4203b0d.png)


- Mapping Caps Lock to Ctrl.

![Modifier keys](https://user-images.githubusercontent.com/2379650/34223523-a2c8e4e4-e58d-11e7-9532-d74b95d8408a.png)

## What if I only want your vim?

First make sure you have a sane vim compiled. On macOS, the following will do:

```
brew install macvim --HEAD --with-override-system-vim --with-python
```

The following commands will install vim-plug and download my `.vimrc`.

After backing up your `~/.vim` directory and `~/.vimrc`:

```
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vimrc https://raw.githubusercontent.com/jnsbl/dotfiles/master/roles/vim/files/vimrc
```

You will now be able to open vim and run `:PlugInstall` to install all plugins.

## TODO

- Full Debian and Red Hat support
- Add more options to `dot` script, e.g. for skipping tasks

[homebrew]: http://brew.sh/
[homebrew-cask]: https://github.com/caskroom/homebrew-cask

## License

[MIT](LICENSE)
