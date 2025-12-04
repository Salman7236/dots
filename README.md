(don't use these, they broken, unless you into that kinda stuff)

# Dotfiles

Managed using the [bare git repo](https://www.atlassian.com/git/tutorials/dotfiles) method. Popularized by this [Hacker News thread.](https://news.ycombinator.com/item?id=11071754)

## How to create a list of explicitly installed packages automatically  

(From the Arch Wiki: [Pacman Tips and Tricks](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages))

1. Create the pacman hook:

    ```bash
    sudoedit /etc/pacman.d/hooks/pkglist.hook
    ```

1. Paste the following content into the `.hook` file:

    ```ini
    [Trigger]
    Operation = Install
    Operation = Remove
    Type = Package
    Target = *

    [Action]
    When = PostTransaction
    Exec = /bin/sh -c '/usr/bin/pacman -Qqe > ~/pkglist.txt'
    ```

> [!TIP]
> [`sudoedit`](https://wiki.archlinux.org/title/Sudo#Editing_files) uses the editor set by the `SUDO_EDITOR` [environment variable](https://wiki.archlinux.org/title/Environment_variables) to edit files owned by root as the current user. Running something like `sudo nvim` opens Neovim without all of the user configuration. That's why your plugins and themes might be missing when you open neovim as root.
