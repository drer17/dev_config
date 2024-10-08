# dev_config
cli dev configs

## ZSH

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### POWERLEVEL10K

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

### TODO CLI

[todo cli](https://github.com/todotxt/todo.txt-cli)

## TMUX

Put config file here...

```
~/.tmux.conf
```

### TPM

Clone package manager...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install packages

```
~/.tmux/plugins/tpm/bin/install_plugins
```

## NvChad

Put dir in ...

## Font

[CaskaydiaMono](https://www.nerdfonts.com/font-downloads)

```
~/.config/nvim/
```

## Lazy Git

To exit on esc, find file location of config as per [here](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)

and save,

```
quitOnTopLevelReturn: true
```
