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
