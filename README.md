# dotfiles


```bash
export GITHUB_USERNAME=qfjz
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

Instalacja dodatkowych pakietów

```
ansible-playbook ~/.bootstrap/pkg-devel.yml --ask-become-pass
```

Lista plików ansible

```
flatpak.yml
fonts.yml
pkg-devel.yml
pkg-i3.yml
pkg-kde.yml
```
