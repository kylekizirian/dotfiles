# dotfiles

## pdbrc

My pdb aliases, tweaked only slightly from
[Ned Batchelder's .pdbrc](https://nedbatchelder.com/blog/200704/my_pdbrc.html).
I described my changes
[here](https://kylekizirian.github.io/ned-batchelders-updated-pdbrc.html).

## gitconfig and gitignore

My git settings. My config aliases were mostly adopted from
[Git Workflows Appendix A](http://documentup.com/skwp/git-workflows-book#appendix-a---the-gitconfig)
and [Gary Bernhardt's gitconfig](https://github.com/garybernhardt/dotfiles).

## vimrc

Largely based off of [Amir Salihefendic's vimrc](https://github.com/amix/vimrc)
and [Gary Bernhardt's vimrc](https://github.com/garybernhardt/dotfiles) with
my own mappings and plugins.

To install plugins

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## inputrc

Adds vim key bindings to GNU readline, so that Python REPL
supports VIM keybindings.

