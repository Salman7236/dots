# Dotfiles

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
