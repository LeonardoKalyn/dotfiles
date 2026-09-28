# .dotfiles

:computer: My personal dotfiles and tweaks for **macOS**.

## Installation

I'm using [Homebrew](https://brew.sh/) to install Mac applications, command-line tools and fonts (see [Brewfile](Brewfile)), and [mise](https://mise.jdx.dev/) to install language versions from each project's `.tool-versions`.

**1.** Check for software updates.

```sh
$ sudo softwareupdate -i -r
```

**2.** Get this project somehow and go to its directory.

```sh
git clone git@github.com:/LeonardoKalyn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

**3.** Install everything: Homebrew packages, apps and fonts, git/zsh/mise/VSCode config, npm globals and macOS defaults.

```sh
$ sh ./install-dotfiles.sh
```

**4.** Install Xcode from the App Store (or [developer.apple.com](https://developer.apple.com/download/applications/)) for iOS builds.

**5.** Restore what can't live in a public repo:

- `~/.ssh` keys and the GPG signing key (`gpg --import`), then add them to GitHub
- `gh auth login`, `tailscale up`, `gcloud auth login`
- `NPM_TOKEN` for the private `@gritspot` npm packages (from 1Password)
- Each project's `.envrc` / `.env` files, then `direnv allow` and `mise install` inside it

## Thanks

We can learn a lot about productivity just exploring the way people work every day. Personally, I got highly inspired by [Holman](https://github.com/holman/dotfiles), [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Deny Dias](https://github.com/denydias/dotfiles) and by this [setup and readme](https://github.com/diessica/dotfiles).

I can't agree more with [Holman](https://github.com/holman)'s thoughts on dotfiles: [dotfiles are meant to be forked](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked).

## License

[MIT License](http://iagodahlem.mit-license.org/) © Iago Dahlem
